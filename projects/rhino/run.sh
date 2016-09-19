#!/usr/bin/env bash

BUILD_DIR=/root

SVC_WAR=rhino.war

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT

  # NOTE: after conversation with dipros on 9/19/2016 it appears there is a future goal to move to something like flyway where migrations from scratch will be supported

  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_pre_migrations.sql

  cd $BUILD_DIR
  python migrate.py --dbUser=root --dbPass=$MYSQL_ROOT_PASSWORD --dbHost=$MYSQL_HOSTNAME --dbName=$MYSQL_DATABASE

fi

set_db_grants

# TODO: remove this once DPRO-1205 is resolved
cp -r /root/ingest/* /root/datastores/ingest/

wait_for_web_service $REPO_SERVICE/config "contentrepo"

curl -X POST $REPO_SERVICE/buckets --data name=corpus

process_template $AMBRA_CONF/context.xml
process_template $AMBRA_CONF/rhino.yaml

start_tomcat
