#!/bin/bash

source $SCRIPTDIR/../projects/run-helpers.sh

COMPOSE_FILE=$SCRIPTDIR/../configurations/$COMPOSE_FILE

function die {
  echo "$@" 1>&2
  stop_stack
  exit 1
}

function get_service_ip {
  CONTAINER_BASENAME=$1

  # TODO: this fails when the terminal is not wide enough. compose bug?
  CONTAINER=$(docker-compose -f $COMPOSE_FILE ps | grep $CONTAINER_BASENAME | awk 'END {print $1}')

  echo $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER)
}

function start_stack {
  docker-compose -f $COMPOSE_FILE up -d
}

function stop_stack {
  docker-compose -f $COMPOSE_FILE kill
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
