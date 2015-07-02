#!/bin/bash

BUILD_DIR=/root

SVC_WAR=wombat-*.war

source $BUILD_DIR/run-helpers.sh

# TODO: templateize configs

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf
cp ${BUILD_DIR}/wombat.yaml /etc/ambra

setup_war_in_tomcat

start_tomcat
