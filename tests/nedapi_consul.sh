#!/usr/bin/env bash

source /flatrack/test-helpers.sh

wait_and_curl http://consulserver:8500 /v1/catalog/service/ned "CONSUL"

wait_and_curl http://nedapi-lb:8080 /v1/service/config "NED"

test_up http://nedapi-lb:8080/v1/typeclasses "Authenticated request" "-u dev:dev"
