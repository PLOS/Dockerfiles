#!/usr/bin/env bash

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export DOCKERFILES=$(pwd)
source flatrack-config.sh

bash $FLATRACK/test.sh $@
