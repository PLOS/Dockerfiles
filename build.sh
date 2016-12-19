#!/usr/bin/env bash

# This script is used to build images from the projects or a group of images defined in a compose file (which we call a stack)

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export DOCKERFILES=$(pwd) # HACK: for now

FLATRACK=flatrack # HACK

source $FLATRACK/build-helpers.sh
source $FLATRACK/stack-helpers.sh

COMMAND=$1
NAME=$2
# DRYRUN=false

USAGE="usage: $0 image|stack|all name [--dry-run]"

# function _build_image {
#   PROJECT=$1
#   echo Building image $PROJECT ...
#   if [ "$DRYRUN" == "false" ]; then
#     build_image $PROJECT
#     # $DOCKERFILES/projects/$PROJECT/build-image.sh || exit 1
#   fi
# }

# if [[ "$3" == "--dry-run" ]]; then
#   DRYRUN=true
# fi

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
    STACK=configurations/$NAME.yml

    IMAGES=$(get_images_from_config $STACK)

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
