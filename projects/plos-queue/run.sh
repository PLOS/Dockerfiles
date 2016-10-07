#!/usr/bin/env bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

process_template $AMBRA_CONF/camel.properties

PLOS_CAMEL_HOME=$BUILD_DIR/plos-queue $BUILD_DIR/runcamel.sh
