#!/bin/bash

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

STACK=configurations/$1.yml

export DOCKERFILES=$(pwd)

if [ "$#" -eq 0 ]; then
  echo APPS: $(find configurations/*.yml -exec basename -s .yml -a {} +)
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
