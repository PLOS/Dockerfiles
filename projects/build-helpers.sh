#!/bin/bash

MAVEN_LOCAL_REPO=maven_local_repo
GITHUB_REPO_BASE=git@github.com:PLOS

function die () {
  echo "$@" 1>&2
  exit 1
}

function build_java_service_images() {

	# TODO: implement --no-cache option or mark images with build date

	BASE_IMAGE=$1
	PROJECT_DIR=$2
	PROJECT_NAME=$3

	DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$PROJECT_DIR
	# assumes the project is locally in the same directory as the Dockerfiles project
	PROJECT_LOCAL_REPO=$DOCKER_SETUP_DIR/../../../${PROJECT_DIR}/

	BUILD_RESULT_DIR=${PROJECT_NAME}_build
	TMP_BUILD_CONTAINER=${PROJECT_NAME}_temp_container

     # checkout the project from git if it doesn't exist on the local machine
	if [ ! -d $PROJECT_LOCAL_REPO ];
	  then
	  echo "Source directory not found $PROJECT_LOCAL_REPO; fetching the project from github ..."
	  git --version > /dev/null || die "git is not installed"

	  git clone ${GITHUB_REPO_BASE}/${PROJECT_DIR} $PROJECT_LOCAL_REPO

	  if [ ! -d $PROJECT_LOCAL_REPO ]; then die "git clone failed"; fi
	fi

	# create build and maven repo volumes if they do not exist
	docker inspect $BUILD_RESULT_DIR > /dev/null
	[ $? -eq 1 ] && docker create -v /build --name $BUILD_RESULT_DIR $BASE_IMAGE /bin/true

	docker inspect $MAVEN_LOCAL_REPO > /dev/null
	[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_LOCAL_REPO $BASE_IMAGE /bin/true

	# build API war
	echo "Building and Loading Java Assets on Base Image (maven)..."

	docker run -it \
	   --volumes-from $MAVEN_LOCAL_REPO \
	   --volumes-from $BUILD_RESULT_DIR \
	   --volume $PROJECT_LOCAL_REPO:/src \
	   --volume $DOCKER_SETUP_DIR:/scripts \
	   --volume $DOCKER_SETUP_DIR/..:/shared \
	   $BASE_IMAGE sh -c 'cp /shared/run-helpers.sh /scripts/run.sh /root/;\
	   	bash /scripts/compile.sh;'

	   	# TODO: --rm this

	# docker run -it --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE sh -c 'tar -cf /root/out.tar /build/*; cat /root/out.tar'> out.tar

	# docker run -it --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE sh -c 'tar -cf /root/out.tar -C /build .; cat /root/out.tar'> out.tar

# IN zsh works: docker run --volumes-from nedapi_build maven:3.3-jdk-8 tar -cf - -C /build . > out3.tar

# ALSO WORKS: docker run --volumes-from nedapi_build maven:3.3-jdk-8 tar -czf - /build/ > out3.tar.gz

	echo "	docker run -it --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE tar -cf - -C /build . > out.tar"

	docker run -it --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE tar -cf - -C /build . > out.tar

	# TODO: run tests in build

	echo "Building base image ..."



	# docker build - < archive.tar.gz     The Dockerfile must be at the root of the archive



	docker build -t $PROJECT_NAME:current $DOCKER_SETUP_DIR

	# copy assets and scripts into image

	echo "Copying Java Assets into Tomcat Image..."

	VERSION=$(docker run --volumes-from $BUILD_RESULT_DIR \
							--name $TMP_BUILD_CONTAINER $PROJECT_NAME:current sh -c \
								'cp -r /build/*  /root;
								 cat /root/version.txt')

	docker commit --change "CMD bash /root/run.sh" $TMP_BUILD_CONTAINER $PROJECT_NAME:current

	# tag docker image with asset version number
	echo "tagging container with version : $VERSION"

	docker tag -f $PROJECT_NAME:current $PROJECT_NAME:$VERSION

	docker rm $TMP_BUILD_CONTAINER
}

"$@"
