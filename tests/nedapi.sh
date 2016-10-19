#!/usr/bin/env bash

source /tests/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED"

test_up nedapi:8080/v1/typeclasses "Authenticated request" "-u dev:dev"

# wait_and_curl https://nedcas:8080 /cas/login "CAS"
