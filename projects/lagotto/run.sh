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

# config application

cp $BUILD_DIR/lagotto.conf /etc/nginx/sites-enabled/lagotto.conf
cp $BUILD_DIR/00_app_env.conf /etc/nginx/conf.d/00_app_env.conf
cp $BUILD_DIR/env.template $SRC/.env

process_env_template $SRC/.env

# set up services

wait_until_db_service_up

# TODO: wait until redis is up
# format of REDIS_URL redis://[:password@]host[:port][/db-number][?option=value]
# wait_until_true "redis-cli INFO" "REDIS"

if ! check_db_exists; then
  set_db_grants
  bundle exec rake db:setup || bundle exec rake db:drop
else
  echo "Skipping creating DB since it already exists"
fi

check_db_exists || exit 1

# run it

# bundle exec rake sidekiq:start
bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e development

/sbin/my_init
