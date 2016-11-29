#!/usr/bin/env bash

# This script is used to build images from the projects or a group of images defined in a compose file (which we call a stack)

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source flatrack/build-helpers.sh
source flatrack/stack-helpers.sh

COMMAND=$1
NAME=$2
DRYRUN=false

USAGE="usage: $0 image|stack|all name [--dry-run]"

export DOCKERFILES=$(pwd)

# function _get_images_from_config {
#   CONFIG_FILE=$1
#   echo $(docker-compose -f $CONFIG_FILE config | grep '^ *image:' | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
# }

function _build_image {
  PROJECT=$1
  echo Building image $PROJECT ...
  if [ "$DRYRUN" == "false" ]; then
    build_image $PROJECT
    # $DOCKERFILES/projects/$PROJECT/build-image.sh || exit 1
  fi
}

# function _list_projects {
#   echo "$(find projects/*/build-image.sh | awk -F/ '{print $(NF-1)}')"
# }

if [[ "$3" == "--dry-run" ]]; then
  DRYRUN=true
fi

if [ "$#" -eq 0 ]; then
  echo $USAGE
elif [[ "$COMMAND" == "image" ]]; then

  if [ -z $NAME ]; then
    echo Choose an image to build:
    list_projects
  else
    _build_image $NAME
  fi

elif [ "$COMMAND" == "stack" ]; then

  if [ -z $NAME ]; then
    echo Choose a stack to build:
    echo "$(find configurations/*.yml -exec basename -s .yml -a {} +)"
  else
    STACK=configurations/$NAME.yml

    IMAGES=$(get_images_from_config $STACK)

    build_images $IMAGES
    # for IMAGE in $IMAGES; do
    #
    #   PROJECT=$(echo $IMAGE | cut -d':' -f1)
    #
    #   if [ -d "$DOCKERFILES/projects/$PROJECT" ]; then
    #
    #     _build_image $PROJECT
    #
    #     docker inspect $IMAGE > /dev/null
    #     if [ $? -ne 0 ]; then
    #       echo "Error: Image $IMAGE does not exist. Perhaps you have the wrong branch of the project checked out."
    #       exit 1;
    #
    #       # TODO: check the git branch and error out there instead. make a method for this in build-helpers.sh since we are importing it
    #       # tricky to do because the git repo name is stored in build-image.sh
    #     fi
    #
    #   fi
    #
    # done;

  fi
elif [ "$COMMAND" == "all" ]; then
  projects=$(_list_projects)
  for project in $projects
  do
    _build_image $project
  done;
else
  echo $USAGE
fi
