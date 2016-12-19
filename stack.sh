#!/usr/bin/env bash

# This script is basically a wrapper around docker-compose with some additional sugar for this project to help determine which compose file to run

# set -x

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export DOCKERFILES=$(pwd)
source flatrack-config.sh

STACK=$1

if [ "$#" -eq 0 ]; then
  echo Choose a stack:
  list_stacks
else
  shift

  args="$@"

  if (( $# == 0 )); then
    args="up"
  fi

  CMD="docker-compose -f $CONFIGURATIONS/$STACK.yml $args"
  echo $CMD
  $CMD

fi
