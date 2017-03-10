#!/usr/bin/env bash

source /envoy/test-helpers.sh

SVC_URL=contentrepo:8080
SVC_NAME="contentrepo"

wait_for_web_service $SVC_URL $SVC_NAME

curl $SVC_URL/config
test_up $SVC_URL/config $SVC_NAME


# TODO: import rhino tests somehow?
