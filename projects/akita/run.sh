#!/bin/bash

NGINX_CONF=akita-nginx.conf

if [ -f /etc/nginx/ssl/nginx.crt ]; then
  NGINX_CONF=akita-nginx-ssl.conf
fi

ln -s /root/$NGINX_CONF /etc/nginx/sites-available/
ln -s /root/$NGINX_CONF /etc/nginx/conf.d/

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
