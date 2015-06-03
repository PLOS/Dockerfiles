#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

setup_simple_tomcat_context ${BUILD_DIR}/context-template.xml

setup_war_in_tomcat cas.war

wait_until_db_schema_ready

start_tomcat
