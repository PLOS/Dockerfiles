#!/bin/bash

MYSQL_ROOT="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

function start_tomcat {
	${CATALINA_HOME}/bin/catalina.sh run
}

function wait_until_db_ready {

	$MYSQL_ROOT -e 'exit'
	MYSQL_NOT_CONNECTING=$?
	while [ $MYSQL_NOT_CONNECTING -ne 0 ] ; do
	    sleep 1;
	    $MYSQL_ROOT -e 'exit'
	    MYSQL_NOT_CONNECTING=$?
	    echo -e "\nDatabase (${MYSQL_HOSTNAME}) not ready ... waiting"
	done;

	echo -e "\nDatabase (${MYSQL_HOSTNAME}) ready!"

}

function set_db_grants {

	echo -e "\nCreating DB User (ned)"
	echo "CREATE USER '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'" | ${MYSQL_ROOT}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | ${MYSQL_ROOT}
	echo "Finished creating user."

}

function setup_war_in_tomcat {

	# allow optional renaming of war to support urls with subdirectories
	TO_WAR=$1
	if [ -z $1 ]; then TO_WAR="ROOT.war"; fi

	echo Deploying war to $TO_WAR

	echo Deleting contents of webapps/
	rm -rf ${CATALINA_HOME}/webapps/*

	echo Checking that WAR exists

	WARCOUNT=$(ls ${BUILD_DIR}/${SVC_WAR} 2> /dev/null | wc -l)

	if [ $WARCOUNT -ne 0 ] ; then
	  echo Copying WAR to webapps
	  cp `ls -t ${BUILD_DIR}/${SVC_WAR} | head -1` ${CATALINA_HOME}/webapps/$TO_WAR
	else
	  echo "WAR file not found in ${BUILD_DIR}. Exiting..."
	  exit 1
	fi

}

# function create_schema {

# 	# TODO: only populate db if it does not exist already

# }


# function simple_tomcat_context_setup {
	
# 	# CONTEXTTEMPLATE=${BUILD_DIR}/context-template.xml

# 	# if [ ! -f "$CONTEXTTEMPLATE" ]; then
# 	#    echo context template not found
# 	#    exit 1
# 	# fi

# 	# echo Creating context file

# 	# # TODO: source these vars from a shared environment file

# 	# sed -i "s/\${db.username}/${MYSQL_USER}/" $CONTEXTTEMPLATE
# 	# sed -i "s/\${db.password}/${MYSQL_USER_PASSWORD}/" $CONTEXTTEMPLATE
# 	# sed -i "s/\${db.driver}/com.mysql.jdbc.Driver/" $CONTEXTTEMPLATE
# 	# sed -i "s/\${db.url}/jdbc:mysql:\/\/${MYSQL_HOSTNAME}:3306\/${MYSQL_DATABASE}/" $CONTEXTTEMPLATE

# 	# cp $CONTEXTTEMPLATE ${CATALINA_HOME}/conf/context.xml

# 	# cat ${CATALINA_HOME}/conf/context.xml
# }
