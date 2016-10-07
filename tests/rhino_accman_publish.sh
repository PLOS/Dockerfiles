#!/usr/bin/env bash

set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=rhino.yml
SVC_TITLE=rhino

source $SCRIPTDIR/test-helpers.sh

ARTICLE=pone.0099781

start_stack

SVC_URL=$(get_docker_host):8080

ARTICLE_PATH=$SVC_URL/articles/10.1371++journal.$ARTICLE

wait_for_web_service $SVC_URL "rhino"

# begin tests

# curl_test_ok $SVC_URL/articles $SVC_TITLE

# ingest an article

curl -X POST --form "archive=@$SCRIPTDIR/test_data/accman/$ARTICLE.zip" $SVC_URL/articles > /dev/null

curl $ARTICLE_PATH
# curl $ARTICLE_PATH | bash $SCRIPTDIR/JSON.sh
# curl $ARTICLE_PATH | bash $SCRIPTDIR/JSON.sh -b
# curl $ARTICLE_PATH | bash $SCRIPTDIR/JSON.sh -p

curl $ARTICLE_PATH | bash $SCRIPTDIR/JSON.sh | sed 's/\"//g' | grep "ingestions,1" #| awk '{print $2}'

INGESTED_STATE=$(parse_json "curl $ARTICLE_PATH" "ingestions,1")

if [[ "$INGESTED_STATE" -ne "1" ]]; then
	tests_failed "Article ingestion failed"
fi

# create a revision

curl -X POST $ARTICLE_PATH/revisions?ingestion=1

REVISION_STATE=$(parse_json "curl $ARTICLE_PATH" "revisions,1")

if [[ "$REVISION_STATE" -ne "1" ]]; then
	tests_failed "Article revision failed"
fi

# make sure SOLR is running

SOLR_BASE=http://$(get_docker_host):8983/solr/collection1

curl_test_ok $SOLR_BASE/admin/ping?wt=json "SOLR up"

curl "$SOLR_BASE/select?q=10.1371%2Fjournal.$ARTICLE&wt=json&indent=true" | grep $ARTICLE

INDEXED_STATE=$?

if [[ "$INDEXED_STATE" -ne "1" ]]; then
	tests_failed "SOLR should start empty"
fi

# index it (queue)

# POST $ARTICLE_PATH?solrIndex=anythinggoeshere




# update the index
run_once indexerminion

# force commit the solr index update
curl $SOLR_BASE/update?commit=true

curl "$SOLR_BASE/select?q=10.1371%2Fjournal.$ARTICLE&wt=json&indent=true" | grep $ARTICLE

INDEXED_STATE=$?

if [[ "$INDEXED_STATE" -ne "0" ]]; then
	tests_failed "indexer failed"
fi


# TODO: fetch categories, and repopulate ?

tests_passed

stop_stack
