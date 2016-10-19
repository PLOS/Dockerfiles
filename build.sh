#!/usr/bin/env bash

# This script is used to build images from the projects or a group of images defined in a compose file (which we call a stack)

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMMAND=$1
NAME=$2

USAGE="usage: $0 image|stack|all name"

export DOCKERFILES=$(pwd)

function _get_images_from_config {
  CONFIG_FILE=$1
  echo $(docker-compose -f $CONFIG_FILE config | grep '^ *image:' | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
}

function _build_image {
  PROJECT=$1
  echo Building image $PROJECT ...
  $DOCKERFILES/projects/$PROJECT/build-image.sh
}

function _list_projects {
  echo "$(find projects/*/build-image.sh | awk -F/ '{print $(NF-1)}')"
}

if [ "$#" -eq 0 ]; then
  echo $USAGE
elif [[ "$COMMAND" == "image" ]]; then

  if [ -z $NAME ]; then
    echo Choose an image to build:
    _list_projects
  else
    _build_image $NAME
  fi

elif [ "$COMMAND" == "stack" ]; then

  if [ -z $NAME ]; then
    echo Choose a stack to build:
    echo "$(find configurations/*.yml -exec basename -s .yml -a {} +)"
  else
    STACK=configurations/$NAME.yml

    IMAGES=$(_get_images_from_config $STACK)

    for IMAGE in $IMAGES; do

      PROJECT=$(echo $IMAGE | cut -d':' -f1)

      if [ -d "$DOCKERFILES/projects/$PROJECT" ]; then

        _build_image $PROJECT

        docker inspect $IMAGE > /dev/null
        if [ $? -ne 0 ]; then
          echo "Error: Image $IMAGE does not exist. Perhaps you have the wrong branch of the project checked out."
          exit 1;
        fi

      fi

    done;

  fi
elif [ "$COMMAND" == "all" ]; then
  projects=$(_list_projects)
  for project in $projects
  do
    _build_image $project || exit 1
  done;
else
  echo $USAGE
fi
