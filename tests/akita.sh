#!/usr/bin/env bash

source /flatrack/test-helpers.sh

wait_and_curl nedapi:8080 /v1/service/config "NED API"
wait_and_curl https://nedcas-ssl:443 /cas/login "CAS"
wait_and_curl https://akita-ssl /registration/new "Akita"
wait_and_curl mailcatcher:1080 / "Mailcatcher"
test_up https://akita-ssl/flanders/v1/types/countries "Rails_to_NED"
