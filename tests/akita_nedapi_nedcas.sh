#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=akita_nedapi_nedcas.yml

source $SCRIPTDIR/test-helpers.sh

start_stack


DOCKER_HOST=$(get_docker_host)
# AKITA=$(get_service_ip akita):80
AKITA=$DOCKER_HOST:80

wait_for_web_service $AKITA

# CAS=$(get_service_ip nedcas):8080
CAS=$DOCKER_HOST:8090

wait_for_web_service $CAS

# begin tests

curl_test_ok $AKITA/registration/new "Akita"

# curl_test_ok $(get_service_ip nedapi):8080/service/config "NED API"
curl_test_ok $DOCKER_HOST:8081/service/config "NED API"

curl_test_ok $CAS/cas/login "CAS"

# curl_test_ok $(get_service_ip mailcatcher):1080 "Mailcatcher"
curl_test_ok $DOCKER_HOST:1080 "Mailcatcher"

# end tests

echo "TESTS PASSED"

stop_stack
