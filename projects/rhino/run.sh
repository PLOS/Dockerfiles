#!/bin/bash

BUILD_DIR=/root

SVC_WAR=rhino.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# TODO: use a more up to date SQL schema dump
if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_schema_1005.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_data.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/issue.sql
fi

set_db_grants

# TODO: remove this once DPRO-1205 is resolved
cp -r /root/ingest/* /root/datastores/ingest/

wait_for_web_service $REPO_SERVICE/config "contentrepo"

curl -X POST $REPO_SERVICE/buckets --data name=corpus

process_template $AMBRA_CONF/context.xml
process_template $AMBRA_CONF/rhino.yaml

start_tomcat
