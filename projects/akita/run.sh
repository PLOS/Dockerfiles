#!/usr/bin/env bash

# set -x

NGINX_DIR=/etc/nginx
NGINX_CONF=nginx.conf

source $HOME/run-helpers.sh

require_envs NED_SERVICE MAILER_ADDRESS MAILER_PORT NED_USERAPP NED_PASSWORD CAS_URL

ln -s $HOME/$NGINX_CONF $NGINX_DIR/sites-available/
ln -s $HOME/$NGINX_CONF $NGINX_DIR/conf.d/

start_consul_agent &

service nginx start
bundle exec puma -C $HOME/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
