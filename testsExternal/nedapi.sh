#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)

wait_and_curl http://$DOCKER_HOST:8081 /v1/service/config "NED"

curl_test_ok http://$DOCKER_HOST:8081/v1/typeclasses "Authenticated request" "-u dev:dev"

# wait_and_curl https://$DOCKER_HOST:8443 /cas/login "CAS"

tests_passed

stop_stack
