#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi_nedcas.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_service_ip nedcas):8080

wait_for_web_service $SVC_URL

# begin tests

curl_test_ok $SVC_URL/cas/login "CAS"

# end tests

echo "TESTS PASSED"

stop_stack
