#!/usr/bin/env bash

set -x

source /envoy/test-helpers.sh

SVC_URL=contentrepo:8080
SVC_NAME="contentrepo"

wait_for_web_service $SVC_URL $SVC_NAME

curl $SVC_URL/config
test_up $SVC_URL/config $SVC_NAME

# create a bucket
BUCKET=bucket_`date +%s`

curl --data "name=$BUCKET" http://$SVC_URL/buckets
	test_true "create bucket"

# create an object
OBJECT=object_`date +%s`

THISSCRIPT=${BASH_SOURCE[0]}

curl -F "create=new" -F "key=$OBJECT" -F "bucketName=$BUCKET" -F "file=@$THISSCRIPT" http://$SVC_URL/objects
	test_true "create object"

# read it back
curl -I http://$SVC_URL/objects/$BUCKET?key=$OBJECT

diff -s <(curl http://$SVC_URL/objects/$BUCKET?key=$OBJECT) $THISSCRIPT > /dev/null
	test_true "read object back"



# TODO: import rhino tests somehow?
#
# wait_for_web_service rhino:8080 "Rhino"
#
#
# test_up rhino:8080/journals "Rhino journals"
#
#
# test_up rhino:8080/journals "Rhino journals222"
