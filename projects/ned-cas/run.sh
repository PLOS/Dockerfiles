#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml
sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}?useUnicode=true\&amp;characterEncoding=utf8/" $CONTEXTTEMPLATE
cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

setup_war_in_tomcat

wait_until_db_ready

start_tomcat
