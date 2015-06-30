#!/bin/bash

MYSQL_ROOT="mysql --default-character-set=utf8 -h ${MYSQL_HOSTNAME} -u root -p${MYSQL_ROOT_PASSWORD}"

function die {
  echo "$@" 1>&2
  exit 1
}

function start_tomcat {
	${CATALINA_HOME}/bin/catalina.sh run
}

function wait_until_db_service_up {

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

function wait_for_web_service {

  URL=$1
  TEST_CMD="curl -sI $URL -o /dev/null"
  TEST_RETURN_CODE=1
  TRY_COUNT=0
  MAX_TRIES=50

  while [ $TEST_RETURN_CODE -ne 0 ] ; do
    sleep 2;
    $TEST_CMD
    TEST_RETURN_CODE=$?
    echo "Service ($URL) not ready ... waiting"

    ((TRY_COUNT++))
    if [ $TRY_COUNT -gt $MAX_TRIES ]; then
      die "Service did not respond in a reasonable amount of time"
    fi

  done;

  echo "Service ($URL) is up and ready for tests"
}

function set_db_grants {

	echo -e "\nCreating DB User (${MYSQL_USER})"
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

function check_db_exists {
	# this function exists because we dont want to recreated a DB if we are pointing to a service that already has a running schema on it
	$MYSQL_ROOT -e 'use ${MYSQL_DATABASE}'
}

function setup_simple_tomcat_context {

	CONTEXT_TEMPALTE=$1

	if [ ! -f "$CONTEXT_TEMPALTE" ]; then
	   echo context template not found
	   exit 1
	fi

	process_template $CONTEXT_TEMPALTE

	cp $CONTEXT_TEMPALTE ${CATALINA_HOME}/conf/context.xml
}

function process_template {
	CONTEXT_TEMPALTE=$1

	echo "Processing template"

  eval "cat <<EOF
$(<$CONTEXT_TEMPALTE)
EOF
" 2> /dev/null > $CONTEXT_TEMPALTE

  cat $CONTEXT_TEMPALTE

}
