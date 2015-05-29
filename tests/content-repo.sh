#!/bin/bash

# TODO: start and stop docker-compose. wait until servcice is up

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $SCRIPTDIR/test-helper.sh

REPO_URL=$(get_service_ip repoapi content-repo.yml):8080


# perform tests

curl $REPO_URL/config

# create a bucket
BUCKET=bucket_`date +%N`

curl --data "name=$BUCKET"  http://$REPO_URL/buckets

# create an object
OBJECT=object_`date +%N`

THISSCRIPT=${BASH_SOURCE[0]}

curl -F "create=new" -F "key=$OBJECT" -F "bucketName=$BUCKET" -F "file=@$THISSCRIPT" http://$REPO_URL/objects

# read it back
curl -I http://$REPO_URL/objects/$BUCKET?key=$OBJECT

diff -s <(curl http://$REPO_URL/objects/$BUCKET?key=$OBJECT) $THISSCRIPT

if [[ $? -eq 0 ]]; then
  echo "TESTS PASSED"
else
  echo "TEST FAILED"
  exit 1
fi
