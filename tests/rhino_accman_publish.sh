#!/usr/bin/env bash

set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=rhino.yml
SVC_TITLE=rhino

source $SCRIPTDIR/test-helpers.sh

start_stack

SVC_URL=$(get_docker_host):8080

wait_for_web_service $SVC_URL "rhino"

# begin tests

ARTICLE=pone.0099781

SOLR_BASE=http://$(get_docker_host):8983/solr/collection1

ARTICLE_RHINO=$SVC_URL/articles/10.1371++journal.$ARTICLE

ARTICLE_SOLR="$SOLR_BASE/select?q=10.1371%2Fjournal.$ARTICLE&wt=json&indent=true"

# ingest an article

curl -X POST --form "archive=@$SCRIPTDIR/test_data/accman/$ARTICLE.zip" $SVC_URL/articles > /dev/null

if [ $(jq $ARTICLE_RHINO .ingestions.\"1\") == "null" ]; then
	tests_failed "Article ingestion failed"
fi

# create a revision

curl -X POST $ARTICLE_RHINO/revisions?ingestion=1

if [ $(jq $ARTICLE_RHINO .revisions.\"1\") == "null" ]; then
	tests_failed "Article revision failed"
fi

# make sure SOLR is running

curl_test_ok $SOLR_BASE/admin/ping?wt=json "SOLR up"

curl $ARTICLE_SOLR | grep $ARTICLE

INDEXED_STATE=$?

if [[ "$INDEXED_STATE" == "0" ]]; then
	tests_failed "SOLR should start empty"
fi

# index it (queue)

curl -X POST $ARTICLE_RHINO?solrIndex=anythinggoeshere

sleep 2 # sloppy wait for queue to run job

# force commit the solr index update
curl $SOLR_BASE/update?commit=true

curl $ARTICLE_SOLR | grep $ARTICLE

INDEXED_STATE=$?

if [ "$INDEXED_STATE" != "0" ]; then
	tests_failed "queue/indexer failed"
fi

# TODO: make some changes that will reflect in the index

# update the index
run_once indexerminion

# force commit the solr index update
curl $SOLR_BASE/update?commit=true

curl $ARTICLE_SOLR | grep $ARTICLE

INDEXED_STATE=$?

if [ "$INDEXED_STATE" != "0" ]; then
	tests_failed "reindex failed"
fi


# TODO: fetch categories, and repopulate ?

tests_passed

stop_stack
