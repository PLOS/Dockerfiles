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
  NAME=$2
  TEST_CMD="curl -sI $URL -o /dev/null"
  TEST_RETURN_CODE=1
  TRY_COUNT=0
  MAX_TRIES=50

  while [ $TEST_RETURN_CODE -ne 0 ] ; do
    sleep 3
    $TEST_CMD
    TEST_RETURN_CODE=$?
    echo "Service $NAME ($URL) not ready ... waiting"

    ((TRY_COUNT++))
    if [ $TRY_COUNT -gt $MAX_TRIES ]; then
      die "Service did not respond in a reasonable amount of time"
    fi

  done;

  echo "Service $NAME ($URL) is up and ready for tests"
}

function set_db_grants {

	echo -e "\nCreating DB User (${MYSQL_USER})"
	echo "CREATE USER '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'" | ${MYSQL_ROOT}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | ${MYSQL_ROOT}
	echo "Finished creating user."

}

function check_db_exists {

  DB=${1:-${MYSQL_DATABASE}}

	# this function exists because we dont want to recreated a DB if we are pointing to a service that already has a running schema on it
	$MYSQL_ROOT -e "use ${DB}"
}

function create_db {
  DB=${1:-${MYSQL_DATABASE}}
  echo "CREATE DATABASE ${DB}" | ${MYSQL_ROOT}
}

function process_template {
	CONTEXT_TEMPALTE=$1

  ls -lh $CONTEXT_TEMPALTE
  head $CONTEXT_TEMPALTE

	echo "Processing template $CONTEXT_TEMPALTE"

  eval "cat <<EOF
$(<$CONTEXT_TEMPALTE)
EOF
" > $CONTEXT_TEMPALTE

  cat $CONTEXT_TEMPALTE

  # TODO: figure out how to ignore bad substitution errors. For example, false positive $ characters in ambra.xml'
}
