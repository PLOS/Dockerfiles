#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_envs NED_SERVICE MAILER_ADDRESS MAILER_PORT NED_USERAPP NED_PASSWORD CAS_URL

cd /src

nginx
bundle exec puma -C $HOME/puma.rb --daemon
tail -f /src/log/* /var/log/nginx/error.log
