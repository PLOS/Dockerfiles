#!/bin/bash

MAVEN_CACHE=maven_cache
GITHUB_REPO_BASE=git@github.com:PLOS

function die () {
  echo "$@" 1>&2
  exit 1
}

function build_java_service_images() {

	BASE_IMAGE=$1
	PROJECT_DIR=$2
	PROJECT_NAME=$3

	DOCKER_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$PROJECT_DIR
	SRC_DIR=$DOCKER_DIR/../../../${PROJECT_DIR}/

	BUILD_CACHE=${PROJECT_NAME}_build
	TMP_BUILD_CONTAINER=${PROJECT_NAME}_temp_container

	if [ ! -d $SRC_DIR ]; then
	  echo "Source directory not found $SRC_DIR"
	  git --version > /dev/null || die "git is not installed"

	  git clone ${GITHUB_REPO_BASE}/${PROJECT_DIR} $SRC_DIR

	  if [ ! -d $SRC_DIR ]; then die "git clone failed"; fi
	fi

	# create build caches if they do not exist

	docker inspect $BUILD_CACHE > /dev/null
	[ $? -eq 1 ] && docker create -v /build --name $BUILD_CACHE $BASE_IMAGE /bin/true

	docker inspect $MAVEN_CACHE > /dev/null
	[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_CACHE $BASE_IMAGE /bin/true

	# build API war

	echo Building java assets

	docker run -it \
	   --volumes-from $MAVEN_CACHE \
	   --volumes-from $BUILD_CACHE \
	   --volume $SRC_DIR:/src \
	   --volume $DOCKER_DIR:/scripts \
	   $BASE_IMAGE bash /scripts/compile.sh

	echo Building base image

	docker build -t $PROJECT_NAME:current $DOCKER_DIR

	# copy assets and scripts into image

	echo Copying java assets into image

	VERSION=$(docker run --volume $DOCKER_DIR:/scripts \
											 --volume $DOCKER_DIR/..:/shared \
											 --volumes-from $BUILD_CACHE \
											 --name $TMP_BUILD_CONTAINER $PROJECT_NAME:current \
											 sh -c 'cp /build/* /root; \
											 				cp /shared/run-helpers.sh /root/; 
											 				cp /scripts/run.sh /root/;
											 				chmod 755 /root/run.sh;
											 				cat /root/version.txt')

	docker commit $TMP_BUILD_CONTAINER $PROJECT_NAME:current

	# tag docker image with asset version number

	echo tagging container with version : $VERSION

	docker tag -f $PROJECT_NAME:current $PROJECT_NAME:$VERSION

	docker rm $TMP_BUILD_CONTAINER

}

"$@"
