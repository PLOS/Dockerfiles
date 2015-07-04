#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

setup_simple_tomcat_context ${BUILD_DIR}/context.xml

setup_war_in_tomcat cas.war

wait_for_web_service $NED_SERVICE/service/config "NED"

start_tomcat
