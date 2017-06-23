#!/usr/bin/env bash

source /envoy/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED API"

test_up nedapi:8080/v1/typeclasses "Authenticated request" "-u dev:dev"

wait_and_curl nedcas:8080 /cas/login "CAS"


# TODO: add test that looks at info globalTypeCount

# this test does not work because the proxy is ready before the base service
# wait_and_curl https://nedcas:443 /cas/login "CAS"
