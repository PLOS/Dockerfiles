#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ambra.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_schema_1005.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_data.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/issue.sql
fi

set_db_grants

# TODO: templateize configs

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp ${BUILD_DIR}/*.xml /etc/ambra
cp /etc/ambra/log4j.xml $CATALINA_HOME/lib
cp /etc/ambra/ehcache.xml $CATALINA_HOME/lib

setup_war_in_tomcat

wait_for_web_service $REPO_SERVICE/config "contentrepo"

start_tomcat
