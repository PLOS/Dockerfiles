#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_schema_1005.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/migrate_ambra_1006.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/migrate_ambra_1007.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/ambra_data.sql
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/issue.sql
else
  echo "Database already exists $MYSQL_DATABASE"
fi

set_db_grants

ls -ln $AMBRA_CONF

process_template $AMBRA_CONF/context.xml
# process_template $AMBRA_CONF/ambra.xml  # TODO: ignore bad substitution errors

wait_for_web_service $REPO_SERVICE/config "contentrepo"

start_tomcat
