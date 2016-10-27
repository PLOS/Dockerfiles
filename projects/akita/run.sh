#!/bin/bash

# set -x

NGINX_DIR=/etc/nginx
NGINX_CONF=nginx.conf

BUILD_DIR=/root
source $BUILD_DIR/run-helpers.sh

ln -s /root/$NGINX_CONF $NGINX_DIR/sites-available/
ln -s /root/$NGINX_CONF $NGINX_DIR/conf.d/

start_consul_agent &

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
