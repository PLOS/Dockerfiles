#!/bin/bash

# TODO: check to see if the image already exists before tryint to build it
../build-image.sh

echo Build finished

docker-compose build

# use RUN so it can send a return value
docker-compose run --rm nedapitester python /root/run_api_tests.py

# clean up runned/stopped container from the above run
docker-compose stop
docker-compose rm -f
