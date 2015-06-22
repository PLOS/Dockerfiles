#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=rhino.yml
SVC_TITLE=rhino

source $SCRIPTDIR/test-helpers.sh

cp $SCRIPTDIR/test_data/pone.0099781.zip $HOME/datastores/ingest

start_stack

# SVC_URL=$(get_service_ip rhino):8080
SVC_URL=$(get_docker_host):8080

wait_for_web_service $SVC_URL

# begin tests

curl_test_ok $SVC_URL/articles $SVC_TITLE

curl -X POST -F name="pone.0099781.zip" $SVC_URL/ingestibles

echo "update article set state=0 where doi like '%pone.0099781'" | mysql -h $(get_docker_host) -P 3306 -uroot -proot ambra
curl_test_ok $SVC_URL/articles/info:doi/10.1371/journal.pone.0099781 $SVC_TITLE

state=$(echo "select state from article where doi like '%pone.0099781'" | mysql -h $(get_docker_host) -P \
3306 -uroot -proot ambra | grep 0)

if [ "$state" != "0" ]
then
  die "pone.0099781 is not published."
fi

# end tests
echo "TESTS PASSED"

stop_stack
