#!/bin/bash

# cd ..
# ./build-image.sh

# echo Build finished

docker-compose build && docker-compose run nedetltester python /test/run_etl_tests.py

echo Return code: $?

docker-compose stop
docker-compose rm -f
