#!/usr/bin/env bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e

# docker build . -t tomcat:7-plos
docker build . -t plos/tomcat:7
