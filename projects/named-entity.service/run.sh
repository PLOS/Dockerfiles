#!/bin/bash

BUILD_DIR=/root

SVC_WAR=named-entity-service-*.war

source $BUILD_DIR/run-helpers.sh

setup_simple_tomcat_context ${BUILD_DIR}/context-template.xml

wait_until_db_ready

if ! check_db_exists; then
  $MYSQL_ROOT < ${BUILD_DIR}/ned-schema.mysql.sql
  $MYSQL_ROOT < ${BUILD_DIR}/ned-data.mysql.sql
fi

set_db_grants

setup_war_in_tomcat

# insert dev:dev user for userapp authentication
# TODO: get this to work out of the war
cd $CATALINA_HOME/webapps/ROOT/WEB-INF
PASSWORD=java -cp classes:$(lib/spring-security-crypto-*.RELEASE.jar | head -1) org.plos.namedentity.spring.security.BCrypt dev
echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','${PASSWORD}');" | $MYSQL_ROOT
echo "SELECT * FROM namedEntities.consumers;" | $MYSQL_ROOT

start_tomcat
