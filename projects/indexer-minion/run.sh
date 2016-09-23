#!/usr/bin/env bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

# TODO: move counter outside of indexerminion
echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
$MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/dpro_plosreports.sql
set_db_grants

process_template $BUILD_DIR/minion.yaml

java -server -d64 -jar $BUILD_DIR/solr-indexer-*-jar-with-dependencies.jar -properties $BUILD_DIR/minion.yaml
