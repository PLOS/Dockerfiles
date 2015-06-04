#!/bin/bash

BUILD_DIR=/root

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp $BUILD_DIR/log4j.xml /usr/local/tomcat/lib

SVC_WAR=solr.war
source $BUILD_DIR/run-helpers.sh

unzip $BUILD_DIR/solr.war -d  $BUILD_DIR/temp/
cp -r $BUILD_DIR/temp/collection1 /usr/local/tomcat/solr/home/
rm -rf  $BUILD_DIR/temp/

setup_war_in_tomcat

export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=/usr/local/tomcat/solr/home"
export JAVA_OPTS="$JAVA_OPTS -Dsolr.data.dir=/usr/local/tomcat/solr/home/data"

start_tomcat
