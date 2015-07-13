#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi_nedcas.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_docker_host):8090
SVC_NAME="CAS"

wait_for_web_service $SVC_URL $SVC_NAME

# begin tests

curl_test_ok $SVC_URL/cas/login $SVC_NAME

# end tests

tests_passed

stop_stack
