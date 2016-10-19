#!/usr/bin/env bash

source /tests/test-helpers.sh

# set -x

SVC_URL=solr:8080
SVC_NAME="solr"

wait_for_web_service $SVC_URL $SVC_NAME

test_up $SVC_URL/solr/ $SVC_NAME

# test_up $SVC_URL/bogus Bogus
