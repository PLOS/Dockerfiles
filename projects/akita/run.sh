#!/bin/bash

service nginx start
bundle exec puma -C /src/docker/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
