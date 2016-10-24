#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_for_web_service $RHINO_SERVICE/config "Rhino"

wait_for_web_service $CAS_LOGIN "CAS"

# TODO: error out if themes not found

process_template $AMBRA_CONF/wombat.yaml

start_tomcat
