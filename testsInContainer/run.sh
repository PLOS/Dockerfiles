#!/usr/bin/env bash

# This is an experimental tester for running tests inside of a container instead of running them on the host bash

# set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export DOCKERFILES=$(pwd)/..

if [ "$#" -eq 0 ]; then
  echo TESTS: $(find -name "*.sh" ! -name "test-helpers.sh" ! -name "run.sh" -exec basename -s .sh -a {} +)
  exit 1
fi

TEST=$1
STACK=$1

CONFIGS_DIR=$SCRIPTDIR/../configurations

COMPOSE_FILE=$CONFIGS_DIR/$STACK.yml

COMPOSE="docker-compose -f $COMPOSE_FILE"

TEST_IMAGE=testrunner

# build testhelper if it does not exist
if ! docker images|grep $TEST_IMAGE ; then
  echo "Building $TEST_IMAGE"
  docker build $SCRIPTDIR --tag $TEST_IMAGE
fi

# start stack
$COMPOSE up -d
$COMPOSE logs --no-color > $SCRIPTDIR/lasttest.log &

# run_the test in the container
docker-compose -f $CONFIGS_DIR/common.yml run --rm $TEST_IMAGE bash /tests/$TEST.sh

EXIT_CODE=$?

[ $EXIT_CODE -eq 0 ] && echo "ALL TESTS PASSED"

echo EXIT CODE : $EXIT_CODE

# stop stack
$COMPOSE kill
$COMPOSE rm -f

# preserve the exit code of the container test
exit $EXIT_CODE
