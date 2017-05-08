#!/usr/bin/env bash

source /envoy/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED API"
wait_and_curl nedcas:8080 /cas/login "CAS"
wait_and_curl akita /registration/new "Akita"
wait_and_curl mailcatcher:1080 / "Mailcatcher"
test_up akita/flanders/v1/types/countries "Rails_to_NED" # | jq . | wc -l
curl akita | grep 'akita' || (echo "akita frontend site not up" && exit 1)
# akita/flanders/status/more  # breaks when ringgold db is not created?
