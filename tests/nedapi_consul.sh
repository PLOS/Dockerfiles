#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi_consul.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)


# TODO: create a way to wait for the CONSUL response size so we dont have to do a guess and sleep
sleep 20



wait_and_curl http://$DOCKER_HOST:8500 /v1/catalog/service/ned "CONSUL"

wait_and_curl http://$DOCKER_HOST:8081 /v1/service/config "NED"

curl_test_ok http://$DOCKER_HOST:8081/v1/typeclasses "Authenticated request" "-u dev:dev"

tests_passed

stop_stack
