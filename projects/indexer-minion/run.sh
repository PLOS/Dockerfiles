#!/usr/bin/env bash

BUILD_DIR=/root

# small hack to get counter database populated, until it is moved outside of here
MYSQL_ROOT_PASSWORD=$COUNTER_DATABASE_ROOT_PASSWORD
MYSQL_USER=$COUNTER_DATABASE_USER
MYSQL_USER_PASSWORD=$COUNTER_DATABASE_PASSWORD
MYSQL_HOSTNAME=$COUNTER_HOSTNAME
MYSQL_DATABASE=$COUNTER_DATABASE

source $BUILD_DIR/run-helpers.sh

# TODO: move counter outside of indexerminion
echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
$MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/dpro_plosreports.sql
set_db_grants

process_template $BUILD_DIR/minion.yaml

java -server -d64 -jar $BUILD_DIR/solr-indexer-*-jar-with-dependencies.jar -properties $BUILD_DIR/minion.yaml
