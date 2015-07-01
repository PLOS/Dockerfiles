#!/bin/bash

mv /root/akita-nginx.conf /etc/nginx/sites-available/

ln -s /etc/nginx/sites-available/akita-nginx.conf /etc/nginx/conf.d/akita-nginx.conf

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
