#!/bin/bash

set -x

NGINX_DIR=/etc/nginx

NGINX_CONF=nginx.conf

BUILD_DIR=/root

export MYSQL_USER=$DB_USERNAME
export MYSQL_USER_PASSWORD=$DB_PASSWORD
export MYSQL_HOSTNAME=$DB_HOST
export MYSQL_DATABASE=$DB_NAME

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  set_db_grants
  rake db:setup
  # create_db
else
  echo "Skipping creating DB since it already exists"
fi

rails server

## ln -s /root/$NGINX_CONF $NGINX_DIR/sites-available/
# ln -s /root/$NGINX_CONF $NGINX_DIR/conf.d/
#
# service nginx start
# bundle exec puma -C /root/puma.rb --daemon
# tail -f /src/log/* /var/log/nginx/error.log
