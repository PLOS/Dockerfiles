#!/bin/bash

BUILD_DIR=/root
# SCRIPTS_DIR=/root

# TODO: complain if BUILD_DIR is not found

# BUILDFILES=$(ls ${BUILD_DIR}/*|wc -l)

# if [ $BUILDFILES -eq 0 ] ; then
#   echo "$BUILD_DIR is empty"
#   exit 1
# fi

# echo $BUILD_DIR
# ls $BUILD_DIR

# echo $SCRIPTS_DIR
# ls $SCRIPTS_DIR

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


echo 'SELECT User FROM mysql.user' | ${MYSQL}

echo -e "\nCreating DB User (ambra)"
echo "CREATE USER '${MYSQL_AMBRA_USER}' IDENTIFIED BY '${MYSQL_AMBRA_PASSWORD}'" | ${MYSQL}
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_AMBRA_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | ${MYSQL}
echo "Finished creating user."

# set up tomcat

# TODO: complain if context.xml is not found in build
#if [ -f "${BUILD_DIR}/context.xml" ] ; then
#  echo ${BUILD_DIR}/context.xml not found
#  cat ${BUILD_DIR}/context.xml
#  exit 1
#fi

cp /usr/local/tomcat/conf/* /etc/ambra
rm -rf /usr/local/tomcat/conf
ln -s /etc/ambra /usr/local/tomcat/conf

cp ${BUILD_DIR}/*.xml /etc/ambra
cp ${BUILD_DIR}/rhino.yaml /etc/ambra

# cp ${BUILD_DIR}/mysql-connector-java-*.jar /usr/local/tomcat/lib/
# cp $BUILD_DIR/tomcat-jdbc-*.jar /usr/local/tomcat/lib/

echo /usr/local/tomcat
ls -l /usr/local/tomcat

echo /usr/local/tomcat/conf
ls -l /usr/local/tomcat/conf


echo /etc/ambra
ls /etc/ambra

echo Deleting contents of webapps/
rm -rf ${CATALINA_HOME}/webapps/*

SVC_WAR=rhino.war

echo Checking that WAR exists

WARCOUNT=$(ls ${BUILD_DIR}/${SVC_WAR} 2> /dev/null | wc -l)

if [ $WARCOUNT -ne 0 ] ; then
  echo Copying WAR to webapps
  cp `ls -t ${BUILD_DIR}/${SVC_WAR} | head -1` ${CATALINA_HOME}/webapps/ROOT.war
else
  echo "WAR file not found in ${BUILD_DIR}. Exiting..."
  exit 1
fi

# wait for db to be ready for service

MYSQL_CMD="mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_AMBRA_USER} -p${MYSQL_AMBRA_PASSWORD} ${MYSQL_DATABASE}"

$MYSQL_CMD -e 'exit'
MYSQL_NOT_CONNECTING=$?
while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
    sleep 1;
    $MYSQL_CMD -e 'exit'
    MYSQL_NOT_CONNECTING=$?
    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for API ... waiting"
done;

echo -e "\nDatabase (${MYSQL_HOSTNAME}) ready!"

echo `ip addr`

# bring up service

${CATALINA_HOME}/bin/catalina.sh run
