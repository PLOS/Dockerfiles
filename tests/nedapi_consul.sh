#!/usr/bin/env bash


source /tests/test-helpers.sh


# TODO: create a way to wait for the CONSUL response size so we dont have to do a guess and sleep
sleep 20

wait_and_curl http://consulserver:8500 /v1/catalog/service/ned "CONSUL"

wait_and_curl http://nedproxy:8081 /v1/service/config "NED"

curl_test_ok http://nedproxy:8081/v1/typeclasses "Authenticated request" "-u dev:dev"
