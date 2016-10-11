#!/usr/bin/env bash

# This is an experimental tester for running tests inside of a container instead of running them on the host bash

set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export DOCKERFILES=$(pwd)/..

TEST=solr


CONFIGS_DIR=$SCRIPTDIR/../configurations

COMPOSE_FILE=$DOCKERFILES/configurations/$TEST.yml

TEST_IMAGE=testrunner

function start_stack {
  docker-compose -f $COMPOSE_FILE up -d
  docker-compose -f $COMPOSE_FILE logs --no-color > $SCRIPTDIR/lasttest.log &
}

function stop_stack {
  docker-compose -f $COMPOSE_FILE kill
  docker-compose -f $COMPOSE_FILE rm -f
}

function run_once {
  IMAGE=$1
  docker-compose -f $CONFIGS_DIR/common.yml run $IMAGE
}


# build testhelper if it does not exist
if ! docker images|grep $TEST_IMAGE ; then
  echo "Building $TEST_IMAGE"
  docker build $SCRIPTDIR -f Dockerfile.testrunner --tag $TEST_IMAGE
fi

start_stack

# run_once

RESULT=$(docker-compose -f $CONFIGS_DIR/common.yml run $TEST_IMAGE bash /tests/$TEST.sh)

echo $?

stop_stack
