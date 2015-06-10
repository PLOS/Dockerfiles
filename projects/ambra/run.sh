#!/bin/bash

BUILD_DIR=/root

SVC_WAR=ambra.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# TODO: use a more up to date SQL schema dump
echo "CREATE SCHEMA IF NOT EXISTS $MYSQL_DATABASE" | $MYSQL_ROOT
$MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_schema.sql
$MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_version.sql

set_db_grants

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp ${BUILD_DIR}/*.xml /etc/ambra
cp /etc/ambra/log4j.xml $CATALINA_HOME/lib
cp /etc/ambra/ehcache.xml $CATALINA_HOME/lib

setup_war_in_tomcat

wait_until_db_ready

start_tomcat
