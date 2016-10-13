#!/usr/bin/env bash

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

STACK=configurations/$1.yml

export DOCKERFILES=$(pwd)

function _get_images_from_config {
  CONFIG_FILE=$1
  echo $(docker-compose -f $CONFIG_FILE config | grep '^ *image:' | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
}

if [ "$#" -eq 0 ]; then
  echo APPS: $(find configurations/*.yml -exec basename -s .yml -a {} +)
else
  shift

  args="$@"

  if [ $1 == "build" ]; then

    IMAGES=$(_get_images_from_config $STACK)

    for IMAGE in $IMAGES; do

      PROJECT=$(echo $IMAGE | cut -d':' -f1)
      PROJECT_DIR="$DOCKERFILES/projects/$PROJECT"

      if [ -d "$PROJECT_DIR" ]; then

        echo Building $PROJECT_DIR ...
        $PROJECT_DIR/build-image.sh

        docker inspect $IMAGE > /dev/null
        if [ $? != "0" ]; then
          echo "Error: Image $IMAGE does not exist. Perhaps you have the wrong branch of the project checked out."
          exit 1;
        fi

      fi

    done;

  else

    if (( $# == 0 )); then
      args="up"
    fi

    CMD="docker-compose -f $STACK $args"
    echo $CMD
    $CMD

  fi

fi
