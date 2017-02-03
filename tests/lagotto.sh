#!/usr/bin/env bash

source /flatrack/test-helpers.sh

wait_and_curl http://lagotto /status "Lagotto status"
wait_and_curl http://lagotto /works "Lagotto works"
