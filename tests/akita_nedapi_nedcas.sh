#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=akita_nedapi_nedcas.yml

source $SCRIPTDIR/test-helper.sh

start_stack

SVC_URL=$(get_service_ip akita)

wait_for_web_service $SVC_URL

# begin tests

curl_test_ok $SVC_URL/registration/new

# end tests

echo "TESTS PASSED"

stop_stack
