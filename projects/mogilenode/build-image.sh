#!/usr/bin/env bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e

docker build -t plos/mogilenode .
# docker build -f Dockerfile.alpine . -t plos/mogilenode
