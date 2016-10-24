#!/usr/bin/env bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e

# docker build -t mogilenode .
docker build -f Dockerfile.alpine . -t mogilenode
