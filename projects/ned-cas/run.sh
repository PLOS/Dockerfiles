#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

process_template ${CATALINA_HOME}/conf/context.xml

wait_for_web_service $NED_SERVICE/service/config "NED"

# cas db

if ! check_db_exists ${CAS_DATABASE}; then
  create_db ${CAS_DATABASE}
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/cas*.sql
fi

start_tomcat
