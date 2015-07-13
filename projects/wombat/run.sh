#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_for_web_service $RHINO_SERVICE/config "rhino"

process_template $AMBRA_CONF/wombat.yaml

start_tomcat
