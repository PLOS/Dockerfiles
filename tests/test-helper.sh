#!/bin/bash

COMPOSE_FILE=$SCRIPTDIR/../configurations/$COMPOSE_FILE


function die () {
  echo "$@" 1>&2
  stop_stack
  exit 1
}

function get_service_ip {
  CONTAINER_BASENAME=$1
  CONTAINER=$(docker-compose -f $COMPOSE_FILE ps | grep $CONTAINER_BASENAME | awk 'END {print $1}')

  echo $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER)
}

function curl_test_ok {

  URL=$1
  echo "curling $URL"

  HTTP_CODE=$(curl -s -w "%{http_code}\\n" $URL -o /dev/null)
  if [[ "$HTTP_CODE" -ne "200" ]]; then
    echo "url = $URL   status code = $HTTP_CODE"
    die "TEST FAILED"
  fi
}

function wait_for_web_service {

  URL=$1
  TEST_CMD="curl -sI $URL -o /dev/null"
  TEST_RETURN_CODE=1
  TRY_COUNT=0

  while [ $TEST_RETURN_CODE -ne 0 ] ; do
    sleep 2;
    $TEST_CMD
    TEST_RETURN_CODE=$?
    echo "Service ($URL) not ready ... waiting"

    ((TRY_COUNT++))
    if [ $TRY_COUNT -gt 20 ]; then
      die "Service did not respond in a reasonable amount of time"
    fi

  done;

  echo "Service ($URL) is up and ready for tests"
}

function start_stack {
  docker-compose -f $COMPOSE_FILE up -d
}

function stop_stack {
  docker-compose -f $COMPOSE_FILE kill
}
