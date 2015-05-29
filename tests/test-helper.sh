#!/bin/bash

COMPOSE_DIR=../configurations

function get_service_ip {
  CONTAINER_BASENAME=$1
  COMPOSE_FILE=$SCRIPTDIR/$COMPOSE_DIR/$2

  CONTAINER=$(docker-compose -f $COMPOSE_FILE ps | grep $CONTAINER_BASENAME | awk 'END {print $1}')

  IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER)

  echo $IP
}

# function wait_for_service {

# }

# function start_stack {

# }

# function stop_stack {

# }
