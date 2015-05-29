#!/bin/bash

COMPOSE_FILE=$SCRIPTDIR/../configurations/$COMPOSE_FILE

function get_service_ip {
  CONTAINER_BASENAME=$1
  CONTAINER=$(docker-compose -f $COMPOSE_FILE ps | grep $CONTAINER_BASENAME | awk 'END {print $1}')

  IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER)

  echo $IP
}

function curl_test_ok {

  URL=$1
  echo "curling $URL"

  HTTP_CODE=$(curl -s -w "%{http_code}\\n" $URL -o /dev/null)
  if [[ "$HTTP_CODE" -ne "200" ]]; then
    echo "url = $URL   status code = $HTTP_CODE"
    echo "TEST FAILED"
    exit 1
  fi
}

function wait_for_web_service {

  URL=$1
  TEST_CMD="curl -I $URL"
  TEST_RETURN_CODE=1

  while [ $TEST_RETURN_CODE -ne 0 ] ; do
    sleep 2;
    $TEST_CMD
    TEST_RETURN_CODE=$?
    echo "Service ($URL) not ready ... waiting"

    # TODO: exit after some time

  done;

  echo "Service ($URL) is up and ready for tests"
}

function start_stack {
  docker-compose -f $COMPOSE_FILE up -d
}

function stop_stack {
  docker-compose -f $COMPOSE_FILE kill
}
