#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
COMPOSE_FILE=content-repo.yml

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_service_ip repoapi):8080

wait_for_web_service $SVC_URL


# perform tests

curl $SVC_URL/config
curl_test_ok $SVC_URL/config

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
  die "TEST FAILED"
fi

echo "TESTS PASSED"

stop_stack
