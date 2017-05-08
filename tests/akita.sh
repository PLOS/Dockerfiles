#!/usr/bin/env bash

source /envoy/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED API"
wait_and_curl nedcas:8080 /cas/login "CAS"
wait_and_curl akita /registration/new "Akita"
wait_and_curl mailcatcher:1080 / "Mailcatcher"
# test_up akita/flanders/v1/types/countries "Rails_to_NED"  # figure out why nginx is giving trouble here
curl akita | grep 'akita' || (echo "akita site no up" && exit 1)
# https://community.plos.org/flanders/status/more
