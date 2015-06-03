#!/bin/bash

BUILD_DIR=/root

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp $BUILD_DIR/log4j.xml /usr/local/tomcat/lib

SVC_WAR=solr.war
source $BUILD_DIR/run-helpers.sh

setup_war_in_tomcat

mkdir /usr/local/tomcat/webapps/home
mkdir /usr/local/tomcat/webapps/home/data

unzip $BUILD_DIR/solr.war -d  $BUILD_DIR/temp/
cp -r $BUILD_DIR/temp/collection1 /usr/local/tomcat/webapps/home/
rm -rf  $BUILD_DIR/temp/

export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=/usr/local/tomcat/webapps/home"
export JAVA_OPTS="$JAVA_OPTS -Dsolr.data.dir=/usr/local/tomcat/webapps/home/data"

start_tomcat
