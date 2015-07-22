#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=solr.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_docker_host):8983
SVC_NAME="solr"

wait_for_web_service $SVC_URL $SVC_NAME

# begin tests

curl_test_ok $SVC_URL/solr/ $SVC_NAME

# end tests

tests_passed

stop_stack
