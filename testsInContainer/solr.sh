#!/usr/bin/env bash

source /projects/run-helpers.sh
source /tests/test-helpers.sh

SVC_URL=solr:8080
SVC_NAME="solr"

wait_for_web_service $SVC_URL $SVC_NAME

curl_test_ok $SVC_URL/solr/ $SVC_NAME

# curl_test_ok $SVC_URL/bogus Bogus

tests_passed
