#!/bin/bash

service nginx start
bundle exec puma -C /root/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
