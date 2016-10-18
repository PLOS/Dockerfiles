#!/usr/bin/env bash

source /tests/test-helpers.sh

SVC_URL=nedapi:8080

wait_and_curl $SVC_URL /v1/service/config "NED"

test_up $SVC_URL/v1/typeclasses "Authenticated request" "-u dev:dev"

# wait_and_curl https://$DOCKER_HOST:8443 /cas/login "CAS"
