#!/bin/bash

BUILD_DIR=/root

cp $CATALINA_HOME/conf/* /etc/ambra
rm -rf $CATALINA_HOME/conf
ln -s /etc/ambra $CATALINA_HOME/conf
cp $BUILD_DIR/log4j.xml $CATALINA_HOME/lib

SVC_WAR=solr.war
source $BUILD_DIR/run-helpers.sh

unzip $BUILD_DIR/solr.war -d  $BUILD_DIR/temp/
cp -r $BUILD_DIR/temp/collection1 $CATALINA_HOME/solr/home/
rm -rf  $BUILD_DIR/temp/

setup_war_in_tomcat solr.war

export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=$CATALINA_HOME/solr/home"
export JAVA_OPTS="$JAVA_OPTS -Dsolr.data.dir=$CATALINA_HOME/solr/home/data"

start_tomcat
