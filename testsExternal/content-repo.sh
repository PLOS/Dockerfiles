#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=contentrepo.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_docker_host):8085
SVC_NAME="contentrepo"

wait_for_web_service $SVC_URL $SVC_NAME


# perform tests

MOGILE_TRACKER=$(get_container_name mogiletracker)

docker exec -it $MOGILE_TRACKER bash -c  "echo -n foo | mogupload --trackers=localhost --domain=maindomain --key=bar --file='-'"

MOGOUT=$(docker exec -it $MOGILE_TRACKER mogfetch --trackers=localhost --domain=maindomain --key=bar --file='-')

if [[ "$MOGOUT" != "foo" ]]; then
	tests_failed "Mogile write failed"
fi


curl $SVC_URL/config
curl_test_ok $SVC_URL/config $SVC_NAME

# create a bucket
BUCKET=bucket_`date +%N`

curl --data "name=$BUCKET" http://$SVC_URL/buckets

# create an object
OBJECT=object_`date +%N`

THISSCRIPT=${BASH_SOURCE[0]}

curl -F "create=new" -F "key=$OBJECT" -F "bucketName=$BUCKET" -F "file=@$THISSCRIPT" http://$SVC_URL/objects

# read it back
curl -I http://$SVC_URL/objects/$BUCKET?key=$OBJECT

diff -s <(curl http://$SVC_URL/objects/$BUCKET?key=$OBJECT) $THISSCRIPT > /dev/null

if [[ $? -ne 0 ]]; then
  tests_failed
fi

tests_passed

stop_stack
