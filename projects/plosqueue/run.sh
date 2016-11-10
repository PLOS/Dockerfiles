#!/usr/bin/env bash

source $HOME/run-helpers.sh

require_envs SOLR_URL RHINO_SERVICE COUNTER_DATABASE_URL \
  COUNTER_DATABASE_USER COUNTER_DATABASE_PASSWORD

process_env_template $AMBRA_CONF/camel.properties

PLOS_CAMEL_HOME=$HOME/plos-queue $HOME/runcamel.sh
