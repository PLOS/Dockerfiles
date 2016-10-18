#!/usr/bin/env bash

set -x

MAVEN_LOCAL_REPO=maven_local_repo
GITHUB_REPO_BASE=git@github.com:PLOS

function die() {
  echo "$@" 1>&2
  exit 1
}

function build_rails_passenger_image() {

  PROJECT_DIR=$1
  IMAGE_NAME=$2

  PROJECT_NAME=$(basename $PROJECT_DIR)

  TMP_BUILD_CONTAINER=${IMAGE_NAME}_temp_container

  BASE_TAG=current

  DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$PROJECT_NAME

  # perhaps they supplied an absolute path to an existing project directory
  PROJECT_LOCAL_REPO=$DOCKER_SETUP_DIR/../../../${PROJECT_DIR}/

  if [[ ${PROJECT_DIR} == \/* ]]; then
    PROJECT_LOCAL_REPO=${PROJECT_DIR}/
  fi

  # TODO: git clone repo if it does not exist

  cd $DOCKER_SETUP_DIR

  cp Dockerfile $PROJECT_LOCAL_REPO      # this is a hack to allow the Dockerfile to exist in this subfolder

  cd $PROJECT_LOCAL_REPO

  BASE_TAG=$(git rev-parse --abbrev-ref HEAD|sed -e 's/[^a-zA-Z0-9_.]/_/g')

  time docker build -t $IMAGE_NAME:$BASE_TAG .
  # cd $DOCKER_SETUP_DIR
  rm $PROJECT_LOCAL_REPO/Dockerfile

  VERSION=$(docker run --volume $DOCKER_SETUP_DIR:/scripts \
  						--volume $DOCKER_SETUP_DIR/..:/shared \
  						--name $TMP_BUILD_CONTAINER $IMAGE_NAME:$BASE_TAG sh -c \
  							'cp /shared/run-helpers.sh /scripts/* /root/;
  					     cat /root/version.txt')

  docker commit --change "CMD bash /root/run.sh" $TMP_BUILD_CONTAINER $IMAGE_NAME:$BASE_TAG

  # tag docker image with asset version number

  echo tagging container with version : $VERSION

  docker tag $IMAGE_NAME:$BASE_TAG $IMAGE_NAME:$VERSION

  docker rm $TMP_BUILD_CONTAINER
}

function build_rails_ember_images() {

  PROJECT_DIR=$1
  IMAGE_NAME=$2

  PROJECT_NAME=$(basename $PROJECT_DIR)

  TMP_BUILD_CONTAINER=${IMAGE_NAME}_temp_container

  BASE_TAG=current

  DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$IMAGE_NAME

  PROJECT_LOCAL_REPO=$DOCKER_SETUP_DIR/../../../${PROJECT_DIR}/

  if [[ ${PROJECT_DIR} == \/* ]]; then
    PROJECT_LOCAL_REPO=${PROJECT_DIR}/
  fi

  # TODO: git clone repo if it does not exist

  cd $DOCKER_SETUP_DIR

  cp Dockerfile $PROJECT_LOCAL_REPO      # this is a hack to allow the Dockerfile to exist in this subfolder
  cp project.dockerignore $PROJECT_LOCAL_REPO/.dockerignore

  # TODO: this overrides to base project. too sloppy
  cp *.yml $PROJECT_LOCAL_REPO/config
  cp setup-*.sh $PROJECT_LOCAL_REPO/bin/ && chmod +x $PROJECT_LOCAL_REPO/bin/setup-*.sh

  # if you pass the "clean" argument, the build will ignore the frontend dependencies that are on your host machine, and pull them down fresh in the container
  # if [ "$2" == "clean" ]; then
  # 	echo -e "frontend/dist\nfrontend/node_modules\nfrontend/bower_components\n" >> $PROJECT_LOCAL_REPO/.dockerignore
  # fi

  # cat $PROJECT_LOCAL_REPO/.dockerignore

  cd $PROJECT_LOCAL_REPO

  BASE_TAG=$(git rev-parse --abbrev-ref HEAD|sed -e 's/[^a-zA-Z0-9_.]/_/g')

  time docker build -t $IMAGE_NAME:$BASE_TAG .
  # cd $DOCKER_SETUP_DIR
  rm $PROJECT_LOCAL_REPO/Dockerfile
  rm $PROJECT_LOCAL_REPO/.dockerignore

  VERSION=$(docker run --volume $DOCKER_SETUP_DIR:/scripts \
  						--volume $DOCKER_SETUP_DIR/..:/shared \
  						--name $TMP_BUILD_CONTAINER $IMAGE_NAME:$BASE_TAG sh -c \
  							'cp /shared/run-helpers.sh /scripts/* /root/;
  					     cat /root/version.txt')

  docker commit --change "CMD bash /root/run.sh" $TMP_BUILD_CONTAINER $IMAGE_NAME:$BASE_TAG

  # tag docker image with asset version number

  echo tagging container with version : $VERSION

  docker tag $IMAGE_NAME:$BASE_TAG $IMAGE_NAME:$VERSION

  docker rm $TMP_BUILD_CONTAINER
}

function build_java_service_images() {

	# TODO: implement --no-cache option or mark images with build date

	BASE_IMAGE=$1
	PROJECT_DIR=$2
	IMAGE_NAME=$3

  PROJECT_NAME=$(basename $PROJECT_DIR)

  BASE_TAG=current

	BUILD_RESULT_DIR=${IMAGE_NAME}_build

	DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$IMAGE_NAME
	# assumes the project is locally in the same directory as the Dockerfiles project
	PROJECT_LOCAL_REPO=$DOCKER_SETUP_DIR/../../../${PROJECT_DIR}/

  # perhaps they supplied an absolute path to an existing project directory
  # if [ -d ${PROJECT_DIR} ]; then
  if [[ ${PROJECT_DIR} == \/* ]]; then
    PROJECT_LOCAL_REPO=${PROJECT_DIR}/
  fi

  # checkout the project from git if it doesn't exist on the local machine
	if [ ! -d $PROJECT_LOCAL_REPO ];
	  then
	  echo "Source directory not found $PROJECT_LOCAL_REPO; fetching the project from github ..."
	  git --version > /dev/null || die "git is not installed"

	  git clone ${GITHUB_REPO_BASE}/${PROJECT_NAME} $PROJECT_LOCAL_REPO

	  if [ ! -d $PROJECT_LOCAL_REPO ]; then die "git clone failed"; fi
	fi

	# create build and maven repo volumes if they do not exist
	docker inspect $BUILD_RESULT_DIR > /dev/null
	[ $? -eq 1 ] && docker create -v /build --name $BUILD_RESULT_DIR $BASE_IMAGE /bin/true

	docker inspect $MAVEN_LOCAL_REPO > /dev/null
	[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_LOCAL_REPO $BASE_IMAGE /bin/true

  BASE_TAG=$(git --git-dir=$PROJECT_LOCAL_REPO/.git rev-parse --abbrev-ref HEAD|sed -e 's/[^a-zA-Z0-9_.]/_/g')

	# build java assets (ie - API war)
	echo "Building and Loading Java Assets on Base Image (maven)..."

	docker run --rm \
	   --volumes-from $MAVEN_LOCAL_REPO \
	   --volumes-from $BUILD_RESULT_DIR \
	   --volume $PROJECT_LOCAL_REPO:/src \
	   --volume $DOCKER_SETUP_DIR:/scripts \
	   --volume $DOCKER_SETUP_DIR/..:/shared \
	   $BASE_IMAGE bash /scripts/compile.sh || die "compile failed"

	echo "Building runnable docker image ..."

  # NOTE: the sudo below is a temp workaround for a bug that might not be fixed until docker 1.10
  # https://github.com/docker/docker/issues/15785
	# docker run --rm --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE sh -c 'tar -czf - -C /build .' | sudo docker build -t $IMAGE_NAME:$BASE_TAG -

  # NOTE: another workaround without sudo: https://github.com/docker/docker/issues/15785#issuecomment-164030356
  TEMP_BUILD_DIR=`mktemp -d`
  docker run --rm --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE sh -c 'tar -czf - -C /build .'  > $TEMP_BUILD_DIR/$IMAGE_NAME-$BASE_TAG.tar
  tar -C $TEMP_BUILD_DIR -xvf $TEMP_BUILD_DIR/$IMAGE_NAME-$BASE_TAG.tar
  docker build -t $IMAGE_NAME:$BASE_TAG $TEMP_BUILD_DIR


	# tag docker image with asset version number
	VERSION=$(docker run --rm --volumes-from $BUILD_RESULT_DIR $BASE_IMAGE cat /build/version.txt)

	echo "image tags = $IMAGE_NAME:$BASE_TAG and $IMAGE_NAME:$VERSION"

	docker tag $IMAGE_NAME:$BASE_TAG $IMAGE_NAME:$VERSION

}

"$@"
