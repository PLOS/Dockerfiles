#!/usr/bin/env bash

source /dockerfiles/tests/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED API"
# wait_and_curl https://$DOCKER_HOST:8444 "/v1/service/config" "NED API ssl"
wait_and_curl https://casproxy:443 /cas/login "CAS"
wait_and_curl https://akitaproxy /registration/new "Akita"
wait_and_curl mailcatcher:1080 / "Mailcatcher"
test_up https://akitaproxy/flanders/v1/types/countries "Rails_to_NED"
