#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

process_template ${CATALINA_HOME}/conf/context.xml

wait_for_web_service $NED_SERVICE/service/config "NED"

start_tomcat
