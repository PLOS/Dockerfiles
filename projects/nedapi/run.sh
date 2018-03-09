#!/usr/bin/env bash

# set -x

source $HOME/run-helpers.sh

require_mysql_envs
require_envs RINGGOLD_DATABASE

wait_until_db_service_up

# ned DB

if ! check_db_exists; then
  create_db
else
  echo "Skipping creating DB since it already exists"
fi

MYSQL="mysql -h ${MYSQL_HOSTNAME} -u ${MYSQL_USER} --password=${MYSQL_USER_PASSWORD} ${MYSQL_DATABASE}"

echo "ALTER TABLE emails ENCRYPTION='Y'" | $MYSQL
echo "ALTER TABLE individualProfiles ENCRYPTION='Y'" | $MYSQL
echo "ALTER TABLE addresses ENCRYPTION='Y'" | $MYSQL
echo "ALTER TABLE phoneNumbers ENCRYPTION='Y'" | $MYSQL

set_db_grants

bash $HOME/flyway-*/flyway -url="jdbc:mysql://${MYSQL_HOSTNAME}:3306/${MYSQL_DATABASE}?useUnicode=true&amp;characterEncoding=utf8" \
    -user=${MYSQL_USER} -password=${MYSQL_USER_PASSWORD} -locations=filesystem:$HOME/migrations migrate

# ringgold DB

if ! check_db_exists ${RINGGOLD_DATABASE}; then
  create_db ${RINGGOLD_DATABASE}
fi

# TODO: seed ringgold

# seed NED with dev data as needed

if [ -n $SEEDS ]; then
  seedlist=${SEEDS//,/$'\n'}
  for seed in $seedlist
  do
    echo "RUNNING SEED: /seeds/$seed.sql"
    $MYSQL_ROOT $MYSQL_DATABASE < /seeds/$seed.sql # || die "seeding error"
  done
fi

echo "SELECT count(*) as user_count FROM namedEntities.individualProfiles;" | $MYSQL_ROOT

process_env_template ${CATALINA_HOME}/conf/context.xml

start_tomcat
