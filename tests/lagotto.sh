#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=lagotto.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)

wait_and_curl http://$DOCKER_HOST:80 /status "Lagotto status"
wait_and_curl http://$DOCKER_HOST:80 /works "Lagotto works"

tests_passed

stop_stack
