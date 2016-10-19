#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=akita.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)

# begin tests

wait_and_curl $DOCKER_HOST:8081 /v1/service/config "NED API"
# wait_and_curl https://$DOCKER_HOST:8444 "/v1/service/config" "NED API ssl"
wait_and_curl https://$DOCKER_HOST:8443 /cas/login "CAS"
wait_and_curl https://$DOCKER_HOST /registration/new "Akita"
wait_and_curl $DOCKER_HOST:1080 / "Mailcatcher"
curl_test_ok https://$DOCKER_HOST/flanders/v1/types/countries "Rails_to_NED"

# end tests

tests_passed

stop_stack
