#!/usr/bin/env bash

source /tests/test-helpers.sh

wait_and_curl http://lagotto /status "Lagotto status"
wait_and_curl http://lagotto /works "Lagotto works"
