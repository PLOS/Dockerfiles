#!/bin/bash

BUILD_DIR=/root

SVC_WAR=rhino.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# TODO: use a more up to date SQL schema dump
if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_schema.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_data.sql
fi

set_db_grants

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp ${BUILD_DIR}/*.xml /etc/ambra
cp ${BUILD_DIR}/rhino.yaml /etc/ambra

setup_war_in_tomcat

wait_for_web_service $REPO_SERVICE/config

curl -X POST $REPO_SERVICE/buckets --data name=corpus

start_tomcat