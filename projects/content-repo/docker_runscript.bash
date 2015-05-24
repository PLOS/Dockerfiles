#!/bin/bash

BUILD_DIR=/root
SVC_WAR=*.war



# wait for DB to be ready for schema

MYSQL="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

echo "DROP SCHEMA IF EXISTS repo; CREATE SCHEMA repo;" | ${MYSQL}
MYSQL_NOT_CONNECTING=$?
while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
    sleep 1;
    echo "CREATE database repo" | ${MYSQL}
    MYSQL_NOT_CONNECTING=$?
    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for schema ... waiting"
done;

# set up db

# echo -e "\nCreating Schema"
# echo "CREATE database repo" | ${MYSQL}

echo -e "\nSeeding Schema"
${MYSQL} < ${BUILD_DIR}/setup.mysql

echo 'SELECT User FROM mysql.user' | ${MYSQL}

echo -e "\nCreating DB User (repouser)"
echo "CREATE USER '${MYSQL_REPO_USER}' IDENTIFIED BY '${MYSQL_REPO_PASSWORD}'" | ${MYSQL}
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_REPO_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | ${MYSQL}
echo "Finished creating user."





# set up tomcat

# echo Deleting contents of webapps/
# rm -rf /var/lib/tomcat7/webapps/*

echo Checking that WAR exists

WARCOUNT=$(ls ${BUILD_DIR}/${SVC_WAR} 2> /dev/null | wc -l)

if [ $WARCOUNT -ne 0 ] ; then
  echo Copying WAR to webapps
  cp `ls -t ${BUILD_DIR}/${SVC_WAR} | head -1` ${CATALINA_HOME}/webapps/ROOT.war
else
  echo "WAR file not found in ${BUILD_DIR}. Exiting..."
  exit 1
fi

MYSQL_CMD="mysql -h ${MYSQL_HOSTNAME} -u repouser repo"

$MYSQL_CMD -e 'exit'
MYSQL_NOT_CONNECTING=$?
while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
    sleep 1;
    $MYSQL_CMD -e 'exit'
    MYSQL_NOT_CONNECTING=$?
    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready ... waiting"
done;

echo -e "\nDatabase (${MYSQL_HOSTNAME}) ready!"

# /etc/init.d/tomcat7 start

# # The container will run as long as the script is running, 
# # that's why we need something long-lived here
# exec tail -f /var/log/tomcat7/catalina.out

${CATALINA_HOME}/bin/catalina.sh run
