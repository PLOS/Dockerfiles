#!/usr/bin/env bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

echo "CREATE SCHEMA $MYSQL_DATABASE" | $MYSQL_ROOT

$MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/plosreports.sql
set_db_grants

# of course when there is actual PHP app running here, it will have to be in the foreground
# tail -f /dev/null
