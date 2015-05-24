#!/bin/bash

BUILD_DIR=/root

ls /root

SVC_WAR=ned-cas-*.war

source $BUILD_DIR/run-helpers.sh

echo $BUILD_DIR

# set up tomcat

CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

if [ ! -f "$CONTEXTTEMPLATE" ]; then
   echo context template not found
   exit 1
fi

echo Creating context file

# TODO: source these vars from a shared environment file

sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}?useUnicode=true\&amp;characterEncoding=utf8/" $CONTEXTTEMPLATE

cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml


setup_war_in_tomcat

# echo Deleting contents of webapps/
# rm -rf ${CATALINA_HOME}/webapps/*

# echo Checking that WAR exists

# WARCOUNT=$(ls ${BUILD_DIR}/${SVC_WAR} 2> /dev/null | wc -l)

# if [ $WARCOUNT -ne 0 ] ; then
#   echo Copying WAR to webapps
#   cp `ls -t ${BUILD_DIR}/${SVC_WAR} | head -1` ${CATALINA_HOME}/webapps/cas.war
# else
#   echo "WAR file not found in ${BUILD_DIR}. Exiting..."
#   exit 1
# fi


wait_db_ready_for_service

# wait for db to be ready for service

# MYSQL_CMD="mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_USER} -p${MYSQL_USER_PASSWORD} ${MYSQL_DATABASE}"

# $MYSQL_CMD -e 'exit'
# MYSQL_NOT_CONNECTING=$?
# while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
#     sleep 1;
#     $MYSQL_CMD -e 'exit'
#     MYSQL_NOT_CONNECTING=$?
#     echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for CAS ... waiting"
# done;

# echo -e "\nDatabase (${MYSQL_HOSTNAME}) ready!"

# bring up service

${CATALINA_HOME}/bin/catalina.sh run
