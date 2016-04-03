#!/bin/bash

NGINX_DIR=/etc/nginx

NGINX_CONF=nginx-ssl.conf

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh




# TODO: figure out pg init



# wait_until_db_service_up
#
# if ! check_db_exists; then
#   create_db
# else
#   echo "Skipping creating DB since it already exists"
# fi

set_db_grants

# if [ "$SSL" == "existingkeys" ]; then
#   NGINX_CONF=nginx-ssl.conf
#   # assumes you have placed/mountd a cert and key in $NGINX_DIR/ssl/
# fi

# if [ "$SSL" == "generatekeys" ]; then
#   NGINX_CONF=nginx-ssl.conf
#
#   ln -s /root/nginx.crt $NGINX_DIR/ssl/
#   ln -s /root/nginx.key $NGINX_DIR/ssl/
# fi

# ln -s /root/$NGINX_CONF $NGINX_DIR/sites-available/
ln -s /root/$NGINX_CONF $NGINX_DIR/conf.d/

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
