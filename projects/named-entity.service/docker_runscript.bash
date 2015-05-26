#!/bin/bash

BUILD_DIR=/root

SVC_WAR=named-entity-service-*.war

source $BUILD_DIR/run-helpers.sh

# config tomcat

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

if [ ! -f "$CONTEXTTEMPLATE" ]; then
   echo context template not found
   exit 1
fi

echo Creating context file

sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}/" $CONTEXTTEMPLATE

cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

cat ${CATALINA_HOME}/conf/context.xml



# TODO: only populate db if it does not exist already


# wait for DB to be ready for schema

MYSQL="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

${MYSQL} < ${BUILD_DIR}/ned-schema.mysql.sql
MYSQL_NOT_CONNECTING=$?
while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
    sleep 1;
    ${MYSQL} < ${BUILD_DIR}/ned-schema.mysql.sql
    MYSQL_NOT_CONNECTING=$?
    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for schema ... waiting"
done;

# set up db

echo -e "\nSeeding NED Schema"
${MYSQL} < ${BUILD_DIR}/ned-data.mysql.sql

set_db_grants

setup_war_in_tomcat

wait_db_ready_for_service

${CATALINA_HOME}/bin/catalina.sh run
