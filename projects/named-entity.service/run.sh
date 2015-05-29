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
# insert dev:dev user fpr userapp authentication
# echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','$2a$04$QYhHKyIbics6CfTXcUUzie7XSDrl3P.53sOklGBaDWFUG5z2Tj0SG');" | $MYSQL_ROOT

echo "REPLACE INTO namedEntities.consumers (name, password) VALUES ('dev','$2a$04$hU.LHE1cHoFZxhXNJS3xZeIi4PDBgIkucfPj6f1hmzVitml23sKy.');" | $MYSQL_ROOT

echo "SELECT * FROM namedEntities.consumers;" | $MYSQL_ROOT

set_db_grants

setup_war_in_tomcat

start_tomcat
