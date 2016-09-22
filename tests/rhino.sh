#!/usr/bin/env bash

set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=rhino.yml
SVC_TITLE=rhino

source $SCRIPTDIR/test-helpers.sh

ARTICLE=pone.0099781

cp $SCRIPTDIR/test_data/$ARTICLE.zip $HOME/datastores/ingest

start_stack

SVC_URL=$(get_docker_host):8080

wait_for_web_service $SVC_URL "rhino"

# begin tests

curl_test_ok $SVC_URL/articles $SVC_TITLE

# ingest an article

# NOTE: ingestion will change when accman goes live

curl -X POST -s -F name="$ARTICLE.zip" $SVC_URL/ingestibles > /dev/null

curl_test_ok $SVC_URL/articles/info:doi/10.1371/journal.$ARTICLE "$SVC_TITLE ingested"

# publish the article

docker exec -it $(get_container_name rhino) sh -c "echo UPDATE article SET state=0 WHERE doi LIKE \'%$ARTICLE\'|mysql -N -h ambradb -P 3306 -uroot -proot ambra"

# docker exec -it $(get_container_name rhino) sh -c "echo select state from article|mysql -h ambradb -P 3306 -uroot -proot ambra"

PUBLISHED_STATE=$(parse_json "curl $SVC_URL/articles/info:doi/10.1371/journal.$ARTICLE" "state")

if [[ "$PUBLISHED_STATE" != "published" ]]; then
	tests_failed "Article publish failed"
fi

tests_passed

stop_stack
