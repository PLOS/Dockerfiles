#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi_nedcas.yml

source $SCRIPTDIR/test-helper.sh

start_stack

SVC_URL=$(get_service_ip nedcas):8080

wait_for_web_service $SVC_URL

# begin tests

curl_test_ok $SVC_URL/cas/login
# curl_test_ok $SVC_URL/cas/status

# end tests

echo "TESTS PASSED"

stop_stack
