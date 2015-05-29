#!/bin/bash

BUILD_DIR=/root

SVC_WAR=named-entity-service-*.war

source $BUILD_DIR/run-helpers.sh

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml
sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}/" $CONTEXTTEMPLATE
cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

wait_until_db_ready

$MYSQL_ROOT < ${BUILD_DIR}/ned-schema.mysql.sql
$MYSQL_ROOT < ${BUILD_DIR}/ned-data.mysql.sql

set_db_grants

setup_war_in_tomcat

start_tomcat
