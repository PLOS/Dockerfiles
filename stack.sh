#!/usr/bin/env bash

# This script is basically a wrapper around docker-compose with some additional sugar for this project to help determine which compose file to run

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

STACK=configurations/$1.yml

export DOCKERFILES=$(pwd)

function _get_images_from_config {
  CONFIG_FILE=$1
  echo $(docker-compose -f $CONFIG_FILE config | grep '^ *image:' | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
}

if [ "$#" -eq 0 ]; then
  echo Choose a stack:
  echo "$(find configurations/*.yml -exec basename -s .yml -a {} +)"
else
  shift

  args="$@"

  if (( $# == 0 )); then
    args="up"
  fi

  CMD="docker-compose -f $STACK $args"
  echo $CMD
  $CMD

fi
