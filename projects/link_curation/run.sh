#!/usr/bin/env bash

NGINX_DIR=/etc/nginx

NGINX_CONF=nginx.conf

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

wait_until_db_service_up

# TODO: wait until db is populated

if [ -f $NGINX_DIR/ssl/nginx.key ]; then
  NGINX_CONF=nginx-ssl.conf
fi

# ln -s /root/$NGINX_CONF $NGINX_DIR/sites-available/
ln -s /root/$NGINX_CONF $NGINX_DIR/conf.d/

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
