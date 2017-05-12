#!/usr/bin/env bash

source $HOME/run-helpers.sh

export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=$CATALINA_HOME/solr/home"
export JAVA_OPTS="$JAVA_OPTS -Dsolr.data.dir=$CATALINA_HOME/solr/home/data"

start_tomcat
# start_tomcat.sh
