#!/usr/bin/env bash

set -x

BUILD_DIR=/root

uname -av
ls -l

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# if ! check_db_exists; then
  # create_db
  # TODO: left off here, getting db to seed
  $MYSQL_ROOT < ${BUILD_DIR}/database.sql
# else
#   echo "Skipping creating DB since it already exists"
# fi

set_db_grants

tail -f /root/*.log
