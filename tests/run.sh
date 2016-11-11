#!/usr/bin/env bash

# This is the test script that runs on the host which initiates a stack and runs tests inside a container.

# set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export DOCKERFILES=$SCRIPTDIR/..

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 testname [stack]"
  echo
  echo "If you dont specify a stack, it will default to be the same as testname."
  echo
  echo TESTS:
  echo "$(find $SCRIPTDIR -name "*.sh" ! -name "test-helpers.sh" ! -name "run.sh" -exec basename -s .sh -a {} +)"
  exit 1
fi

TEST=$1
STACK=$1

if [[ -n $2 ]]; then
  STACK=$2
fi

CONFIGS_DIR=$SCRIPTDIR/../configurations

COMPOSE_FILE=$CONFIGS_DIR/$STACK.yml

COMPOSE="docker-compose -f $COMPOSE_FILE"

TEST_IMAGE=testrunner

echo Running tests/$TEST.sh against $COMPOSE_FILE

# build testhelper if it does not exist
if ! docker images|grep $TEST_IMAGE ; then
  echo "Building $TEST_IMAGE"
  docker build $SCRIPTDIR --tag $TEST_IMAGE
fi

# kill the lingering instances and state
$COMPOSE kill
$COMPOSE rm -f -v

# start stack
$COMPOSE up -d
$COMPOSE logs --no-color > $SCRIPTDIR/lasttest.log &

# TODO: is there a way to run this in the foreground perhaps so we can ^C out of it? as of now, that does not work.
# run_the test in the container
# docker-compose -f $CONFIGS_DIR/common.yml run --rm $TEST_IMAGE sh -c "source /dockerfiles/tests/test-helpers.sh && bash /tests/$TEST.sh"
docker-compose -f $CONFIGS_DIR/common.yml run --rm $TEST_IMAGE bash /dockerfiles/tests/$TEST.sh

EXIT_CODE=$?

[ $EXIT_CODE -eq 0 ] && echo "ALL TESTS PASSED"

echo EXIT CODE : $EXIT_CODE

# stop stack
$COMPOSE kill
$COMPOSE rm -f -v

# preserve the exit code of the container test
exit $EXIT_CODE
