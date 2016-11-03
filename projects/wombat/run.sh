#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_for_web_service $RHINO_SERVICE/config "Rhino"

# NOTE; we dont wait for CAS because it can sometimes use the public facing route (ie - localhost) which is not accessable inside the NAT.

# TODO: error out if themes not found

process_template $AMBRA_CONF/wombat.yaml

start_tomcat
