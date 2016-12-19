#!/usr/bin/env bash

# This script is used to build images from the projects or a group of images defined in a compose file (which we call a stack)

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export DOCKERFILES=$(pwd)
source flatrack-config.sh

COMMAND=$1
NAME=$2

USAGE="usage: $0 image|stack|all name"

if [ "$#" -eq 0 ]; then
  echo $USAGE
elif [[ "$COMMAND" == "image" ]]; then

  if [ -z $NAME ]; then
    echo Choose an image to build:
    list_projects
  else
    build_image $NAME
  fi

elif [ "$COMMAND" == "stack" ]; then

  if [ -z $NAME ]; then
    echo Choose a stack to build:
    list_stacks
  else
    IMAGES=$(get_images_from_config $CONFIGURATIONS/$NAME.yml)

    build_images $IMAGES
  fi
elif [ "$COMMAND" == "all" ]; then
  projects=$(list_projects)
  for project in $projects
  do
    build_image $project
  done;
else
  echo $USAGE
fi
