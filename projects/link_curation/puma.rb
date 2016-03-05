#!/usr/bin/env puma

directory '/src/'
rackup '/src/config.ru'
environment 'integration'

pidfile '/var/log/app/puma.pid'
state_path '/var/log/app/puma.state'
stdout_redirect '/var/log/app/puma_error.log', '/var/log/app/puma_access.log', true

threads 0,16

bind 'unix:///var/log/app/puma.sock'
workers 4

preload_app!
