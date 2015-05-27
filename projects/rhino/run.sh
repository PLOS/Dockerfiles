#!/bin/bash

BUILD_DIR=/root

SVC_WAR=rhino.war

source $BUILD_DIR/run-helpers.sh

# wait for DB to be ready for schema

MYSQL="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

echo "CREATE SCHEMA IF NOT EXISTS $MYSQL_DATABASE" | ${MYSQL}
MYSQL_NOT_CONNECTING=$?
while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
    sleep 1;
    echo "CREATE SCHEMA IF NOT EXISTS $MYSQL_DATABASE" | ${MYSQL}
    MYSQL_NOT_CONNECTING=$?
    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for schema ... waiting"
done;

# set up db

# TODO: use a more up to date SQL schema dump
echo -e "\nCreating Schema"
${MYSQL} $MYSQL_DATABASE < ${BUILD_DIR}/ddl_mysql.sql

set_db_grants

# set up tomcat

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf

cp ${BUILD_DIR}/*.xml /etc/ambra
cp ${BUILD_DIR}/rhino.yaml /etc/ambra

echo /root
ls -l /root

setup_war_in_tomcat

wait_db_ready_for_service

${CATALINA_HOME}/bin/catalina.sh run
