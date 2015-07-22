#!/bin/bash

BUILD_DIR=/root

source $BUILD_DIR/run-helpers.sh

export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=$CATALINA_HOME/solr/home"
export JAVA_OPTS="$JAVA_OPTS -Dsolr.data.dir=$CATALINA_HOME/solr/home/data"

start_tomcat
