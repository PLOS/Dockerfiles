#!/bin/bash

BUILD_DIR=/root

SVC_WAR=named-entity-service-*.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  $MYSQL_ROOT < ${BUILD_DIR}/ned-schema.mysql.sql
  $MYSQL_ROOT < ${BUILD_DIR}/ned-data.mysql.sql
fi

set_db_grants

# insert dev:dev user for userapp authentication
unzip -q $BUILD_DIR/$SVC_WAR -d $BUILD_DIR/ned
cd $BUILD_DIR/ned/WEB-INF
PASSWORD=$(java -cp classes:$(ls lib/spring-security-crypto-*.RELEASE.jar | head -1) org.plos.namedentity.spring.security.BCrypt dev)
echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','${PASSWORD}');" | $MYSQL_ROOT
echo "SELECT * FROM namedEntities.consumers;" | $MYSQL_ROOT

process_template ${CATALINA_HOME}/conf/context.xml

start_tomcat
