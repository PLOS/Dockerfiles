#!/usr/bin/env bash

NGINX_DIR=/etc/nginx

NGINX_CONF=nginx.conf

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

if ! check_db_exists; then
  echo "Error: Database not populated. Make sure mediaTracker was setup"
  exit 1
  # create_db
  # $MYSQL_ROOT $MYSQL_DATABASE < ${BUILD_DIR}/schema.sql
# else
  # echo "Skipping creating DB since it already exists"
fi

# set_db_grants

# echo 'Populating schema'
# rake db:create:all
# rake db:migrate
# rake db:setup

if [ -f $NGINX_DIR/ssl/nginx.key ]; then
  NGINX_CONF=nginx-ssl.conf
fi

# ln -s /root/$NGINX_CONF $NGINX_DIR/sites-available/
ln -s /root/$NGINX_CONF $NGINX_DIR/conf.d/

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
