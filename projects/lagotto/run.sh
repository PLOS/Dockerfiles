#!/bin/bash

set -x

NGINX_DIR=/etc/nginx

NGINX_CONF=nginx.conf

BUILD_DIR=/root

SRC=/home/app/lagotto

export MYSQL_USER=$DB_USERNAME
export MYSQL_USER_PASSWORD=$DB_PASSWORD
export MYSQL_HOSTNAME=$DB_HOST
export MYSQL_DATABASE=$DB_NAME

source $BUILD_DIR/run-helpers.sh

# set up services

wait_until_db_service_up

if ! check_db_exists; then
  set_db_grants
  bundle exec rake db:setup

  check_db_exists || exit 1
else
  echo "Skipping creating DB since it already exists"
fi

# config application

cp $BUILD_DIR/lagotto.conf /etc/nginx/sites-enabled/lagotto.conf
cp $BUILD_DIR/00_app_env.conf /etc/nginx/conf.d/00_app_env.conf

cp $BUILD_DIR/env.template $SRC/.env

process_template $SRC/.env

# run it

/sbin/my_init
