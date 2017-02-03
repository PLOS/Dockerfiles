#!/usr/bin/env bash

source /flatrack/test-helpers.sh

SVC_URL=contentrepo:8080
SVC_NAME="contentrepo"

wait_for_web_service $SVC_URL $SVC_NAME


# MOGILE_TRACKER=$(get_container_name mogiletracker)
#
# docker exec -it $MOGILE_TRACKER bash -c  "echo -n foo | mogupload --trackers=localhost --domain=maindomain --key=bar --file='-'"
#
# MOGOUT=$(docker exec -it $MOGILE_TRACKER mogfetch --trackers=localhost --domain=maindomain --key=bar --file='-')
#
# [ "$MOGOUT" == "foo" ]
# 	tests_true "Mogile write"


curl $SVC_URL/config
test_up $SVC_URL/config $SVC_NAME

# create a bucket
BUCKET=bucket_`date +%N`

curl --data "name=$BUCKET" http://$SVC_URL/buckets
	test_true "create bucket"

# create an object
OBJECT=object_`date +%N`

THISSCRIPT=${BASH_SOURCE[0]}

curl -F "create=new" -F "key=$OBJECT" -F "bucketName=$BUCKET" -F "file=@$THISSCRIPT" http://$SVC_URL/objects
	test_true "create object"

# read it back
curl -I http://$SVC_URL/objects/$BUCKET?key=$OBJECT

diff -s <(curl http://$SVC_URL/objects/$BUCKET?key=$OBJECT) $THISSCRIPT > /dev/null
	test_true "read object back"
