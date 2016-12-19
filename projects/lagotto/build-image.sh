#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../flatrack-config.sh
  build_rails_passenger_image lagotto lagotto
