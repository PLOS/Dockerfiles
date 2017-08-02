#!/usr/bin/env bash

source $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../envoy-config.sh
  # build_rails_ember_images akita akita

# bash $ENVOY/builders/rails.sh akita akita

# bash $ENVOY/builders/ember_rails_nobuild.sh akita akita

# bash $ENVOY/builders/ember_rails.sh akita akita

bash $ENVOY/builders/node6.sh akita akita
