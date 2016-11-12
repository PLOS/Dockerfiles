#!/usr/bin/env bash

set -x

# TODO: make these build methods DRY

GITHUB_REPO_BASE=git@github.com:PLOS

DOCKERFILES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

function die() {
  echo "$@" 1>&2
  exit 1
}

function build_image {
  PROJECT=$1
  echo Building image $PROJECT ...
  # if [ "$DRYRUN" == "false" ]; then
    $DOCKERFILES/projects/$PROJECT/build-image.sh || exit 1
  # fi
}

function get_git_branch {
  PROJECT_DIR=$1
  echo $(git --git-dir=$PROJECT_DIR/.git rev-parse --abbrev-ref HEAD|sed -e 's/[^a-zA-Z0-9_.]/_/g')
}

function get_local_src_dir {
  PROJECT_DIR=$1

  # assumes the project is locally in the same directory as the Dockerfiles project
	PROJECT_LOCAL_REPO=$DOCKERFILES/../${PROJECT_DIR}/

  # perhaps they supplied an absolute path to an existing project directory
  # if [ -d ${PROJECT_DIR} ]; then
  if [[ ${PROJECT_DIR} == \/* ]]; then
    PROJECT_LOCAL_REPO=${PROJECT_DIR}/
  fi

  echo $PROJECT_LOCAL_REPO
}

# looks for a local source directory and checks it out from git if missing
function check_local_src {

	PROJECT_DIR=$1

  PROJECT_NAME=$(basename $PROJECT_DIR)
  PROJECT_LOCAL_REPO=$(get_local_src_dir $PROJECT_DIR)

  # checkout the project from git if it doesn't exist on the local machine
  if [ ! -d $PROJECT_LOCAL_REPO ];
    then
    echo "Source directory not found $PROJECT_LOCAL_REPO; fetching the project from github ..."
    git --version > /dev/null || die "git is not installed"

    git clone ${GITHUB_REPO_BASE}/${PROJECT_NAME} $PROJECT_LOCAL_REPO

    if [ ! -d $PROJECT_LOCAL_REPO ]; then die "git clone failed"; fi
  fi
}

_builder_to_runner() {

  # pipe the build assets from the build volume to the runner image

  BUILD_VOLUME=$1
  BUILD_IMAGE=$2
  RUN_IMAGE=$3

  docker run --rm --volume $BUILD_VOLUME:/build $BUILD_IMAGE sh -c 'tar -czf - -C /build .' | docker build -t $RUN_IMAGE - || die "build failed"

}


function build_java_image() {

  # most of the depend on a base image so make sure it exists
  build_image tomcat

  MAVEN_LOCAL_REPO=maven_local_repo

	# TODO: implement --no-cache option or mark images with build date

	BASE_IMAGE=maven:3-jdk-8-alpine
	PROJECT_DIR=$1
	IMAGE_NAME=$2

  PROJECT_NAME=$(basename $PROJECT_DIR)

  BASE_TAG=current

	BUILD_RESULT_DIR=${IMAGE_NAME}_build

  DOCKER_SETUP_DIR=$DOCKERFILES/projects/$IMAGE_NAME

  PROJECT_LOCAL_REPO=$(get_local_src_dir $PROJECT_DIR)

	check_local_src $PROJECT_DIR

  # create shared maven cache to use accross projects
  docker volume create --name $MAVEN_LOCAL_REPO

  # create build volume to store compiled assets
  docker volume create --name $BUILD_RESULT_DIR

  # BASE_TAG=$(git --git-dir=$PROJECT_LOCAL_REPO/.git rev-parse --abbrev-ref HEAD|sed -e 's/[^a-zA-Z0-9_.]/_/g')
  BASE_TAG=$(get_git_branch $PROJECT_LOCAL_REPO)

	echo "Building and Loading Java Assets on Base Image (maven)..."

  # compile the java assets using a container and save results to build volume
	docker run --rm \
    --volume $MAVEN_LOCAL_REPO:/root/.m2 \
    --volume $BUILD_RESULT_DIR:/build \
    --volume $PROJECT_LOCAL_REPO:/src \
    --volume $DOCKER_SETUP_DIR:/scripts \
	  --volume $DOCKER_SETUP_DIR/..:/shared \
	  $BASE_IMAGE bash /scripts/compile.sh || die "compile failed"

	echo "Building runnable docker image ..."
  _builder_to_runner $BUILD_RESULT_DIR $BASE_IMAGE "$IMAGE_NAME:$BASE_TAG"

	# tag docker image with asset version number
	VERSION=$(docker run --rm --volume $BUILD_RESULT_DIR:/build $BASE_IMAGE cat /build/version.txt)

	echo "image tags = $IMAGE_NAME:$BASE_TAG and $IMAGE_NAME:$VERSION"

	docker tag $IMAGE_NAME:$BASE_TAG $IMAGE_NAME:$VERSION

  # clean up
  docker volume rm $BUILD_RESULT_DIR
}

function build_rails_passenger_image() {

  PROJECT_DIR=$1
  IMAGE_NAME=$2

  PROJECT_NAME=$(basename $PROJECT_DIR)

  TMP_BUILD_CONTAINER=${IMAGE_NAME}_temp_container

  BASE_TAG=current

  # TODO: use $DOCKERFILES instead
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

  # TODO: use $DOCKERFILES instead
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

function build_non_runnable_images() {

	BASE_IMAGE=bash
	PROJECT_DIR=$1
	IMAGE_NAME=$2

  PROJECT_NAME=$(basename $PROJECT_DIR)

  BASE_TAG=current

	BUILD_RESULT_DIR=${IMAGE_NAME}_build

  DOCKER_SETUP_DIR=$DOCKERFILES/projects/$IMAGE_NAME

  PROJECT_LOCAL_REPO=$(get_local_src_dir $PROJECT_DIR)

  check_local_src $PROJECT_DIR

  # create build volume to store compiled assets
  docker volume create --name $BUILD_RESULT_DIR

  BASE_TAG=$(get_git_branch $PROJECT_LOCAL_REPO)

	# build assets
	echo "Building and Loading Base Image..."

	docker run --rm \
    --volume $BUILD_RESULT_DIR:/build \
	  --volume $PROJECT_LOCAL_REPO:/src \
	  --volume $DOCKER_SETUP_DIR:/scripts \
	  --volume $DOCKER_SETUP_DIR/..:/shared \
	  $BASE_IMAGE bash /scripts/compile.sh || die "compile failed"

	echo "Building runnable docker image ..."
  _builder_to_runner $BUILD_RESULT_DIR $BASE_IMAGE "$IMAGE_NAME:$BASE_TAG"

  echo "image tag = $IMAGE_NAME:$BASE_TAG"

  # clean up
  docker volume rm $BUILD_RESULT_DIR
}

# execute as subshell if this script is not being sourced
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && "$@"
