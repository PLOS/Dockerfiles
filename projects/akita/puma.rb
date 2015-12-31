#!/usr/bin/env puma

directory '/src/'
rackup '/src/config.ru'
environment 'integration'  # because it is production with mailcatcher

pidfile '/var/log/akita/puma.pid'
state_path '/var/log/akita/puma.state'
stdout_redirect '/var/log/akita/puma_error.log', '/var/log/akita/puma_access.log', true

threads 0,16

bind 'unix:///var/log/akita/puma.sock'
workers 4

preload_app!
