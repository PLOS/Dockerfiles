#!/usr/bin/env bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e

docker build -f Dockerfile.ubuntu . -t plos/mogiletracker
