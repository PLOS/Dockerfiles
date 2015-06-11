#!/bin/bash

BUILD_DIR=/root

SVC_WAR=*.war

source $BUILD_DIR/run-helpers.sh

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

setup_db_in_tomcat_context_template $CONTEXTTEMPLATE

# sed -i "s/\${objstore.type}/InMemoryStore/" $CONTEXTTEMPLATE

cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml


wait_until_db_service_up

if ! check_db_exists; then
  echo "Setting up schema"
  echo "DROP SCHEMA IF EXISTS ${MYSQL_DATABASE}; CREATE SCHEMA ${MYSQL_DATABASE};" | $MYSQL_ROOT
  $MYSQL_ROOT < ${BUILD_DIR}/setup.mysql
  # TODO: run schema migrations
fi

set_db_grants

setup_war_in_tomcat

start_tomcat
