#!/usr/bin/env bash

set -x

BUILD_DIR=/root

uname -av
ls -l

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  create_db
  $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/schema.sql
else
  echo "Skipping creating DB since it already exists"
fi

set_db_grants

# NOTE: no foreground process. set cron for execution instead?
