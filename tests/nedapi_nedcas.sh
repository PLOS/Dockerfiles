#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=nedapi_nedcas.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

DOCKER_HOST=$(get_docker_host)

wait_and_curl https://$DOCKER_HOST:8443 /cas/login "CAS"

tests_passed

stop_stack
