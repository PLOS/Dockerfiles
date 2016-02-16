#!/bin/bash

/root/consul agent -server -data-dir /tmp/consul & #-config-dir /etc/consul.d &

nginx -g "daemon off;"
