#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=akita_nedapi_nedcas.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)
AKITA=$DOCKER_HOST:80
AKITA_NAME="akita"

wait_for_web_service $AKITA $AKITA_NAME

CAS=$DOCKER_HOST:8090

wait_for_web_service $CAS "CAS"

# begin tests

curl_test_ok $AKITA/registration/new $AKITA_NAME
curl_test_ok $DOCKER_HOST:8081/v0/service/config "NED API"
curl_test_ok $CAS/cas/login "CAS"
curl_test_ok $DOCKER_HOST:1080 "Mailcatcher"

# end tests

tests_passed

stop_stack
