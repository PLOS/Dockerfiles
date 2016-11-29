#!/usr/bin/env bash

export DOCKERFILES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# TODO: set from env?
export FLATRACK=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/flatrack

export TESTS=$DOCKERFILES/tests

bash $FLATRACK/test.sh $@
