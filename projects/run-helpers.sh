#!/bin/bash

# TODO: only populate db if it does not exist already


function create_schema {

	# wait for DB to be ready for schema

	MYSQL="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

	$MYSQL_CREATE_SCHEMA
	# ${MYSQL} < ${BUILD_DIR}/ned-schema.mysql.sql
	MYSQL_NOT_CONNECTING=$?
	while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
	    sleep 1;
	    $MYSQL_CREATE_SCHEMA
	    # ${MYSQL} < ${BUILD_DIR}/ned-schema.mysql.sql
	    MYSQL_NOT_CONNECTING=$?
	    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for schema ... waiting"
	done;
}

# set up db

# echo -e "\nCreating NED Schema"
# ${MYSQL} < ${BUILD_DIR}/ned-schema.mysql.sql

# echo -e "\nSeeding NED Schema"
# ${MYSQL} < ${BUILD_DIR}/ned-data.mysql.sql

function db_grants {

	echo 'SELECT User FROM mysql.user' | ${MYSQL}

	echo -e "\nCreating DB User (ned)"
	echo "CREATE USER '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'" | ${MYSQL}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | ${MYSQL}
	echo "Finished creating user."

}

# # set up tomcat

# CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

# if [ ! -f "$CONTEXTTEMPLATE" ]; then
#    echo context template not found
#    exit 1
# fi

# echo Creating context file

# # TODO: source these vars from a shared environment file

# sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
# sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
# sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
# sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}/" $CONTEXTTEMPLATE

# cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

# cat ${CATALINA_HOME}/conf/context.xml

function setup_war_in_tomcat {

	echo Deleting contents of webapps/
	rm -rf ${CATALINA_HOME}/webapps/*

	echo Checking that WAR exists

	WARCOUNT=$(ls ${BUILD_DIR}/${SVC_WAR} 2> /dev/null | wc -l)

	if [ $WARCOUNT -ne 0 ] ; then
	  echo Copying WAR to webapps
	  cp `ls -t ${BUILD_DIR}/${SVC_WAR} | head -1` ${CATALINA_HOME}/webapps/ROOT.war
	else
	  echo "WAR file not found in ${BUILD_DIR}. Exiting..."
	  exit 1
	fi

}

# wait for db to be ready for service

function wait_db_ready_for_service {

	MYSQL_CMD="mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_USER} -p${MYSQL_USER_PASSWORD} ${MYSQL_DATABASE}"

	$MYSQL_CMD -e 'exit'
	MYSQL_NOT_CONNECTING=$?
	while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
	    sleep 1;
	    $MYSQL_CMD -e 'exit'
	    MYSQL_NOT_CONNECTING=$?
	    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready for API ... waiting"
	done;

	echo -e "\nDatabase (${MYSQL_HOSTNAME}) ready!"

}
