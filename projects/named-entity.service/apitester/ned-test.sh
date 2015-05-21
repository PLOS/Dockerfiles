#!/bin/bash

cd ../builder
./ned-build.sh

echo Build finished

cd -
docker-compose build

# use RUN so it can send a return value
docker-compose run nedapitester python /root/run_api_tests.py

# TODO: clean up runned/stopped container from the above run
docker-compose stop
docker-compose rm -f
