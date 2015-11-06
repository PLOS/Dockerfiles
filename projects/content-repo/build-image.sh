#!/bin/bash

# so this script can be run from any directory
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e

../build-helpers.sh build_java_service_images maven:3.3-jdk-8 content-repo contentrepo

# build mogile images
docker build -t mogiletracker mogiletracker
docker build -t mogilenode mogilenode
