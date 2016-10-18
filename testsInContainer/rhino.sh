#!/usr/bin/env bash

# set -x

source /tests/test-helpers.sh

SVC_URL=rhino:8080

wait_for_web_service $SVC_URL "rhino"

# begin tests

ARTICLE=pone.0099781

SOLR_BASE=http://solr:8080/solr/collection1

ARTICLE_RHINO=$SVC_URL/articles/10.1371++journal.$ARTICLE

ARTICLE_SOLR="$SOLR_BASE/select?q=10.1371%2Fjournal.$ARTICLE&wt=json&indent=true"

# ingest an article

curl -X POST --form "archive=@/tests/test_data/accman/$ARTICLE.zip" $SVC_URL/articles > /dev/null

[ $(curl $ARTICLE_RHINO | jq .ingestions.\"1\") != "null" ]
	test_true "Article ingestion"

# create a revision

curl -X POST $ARTICLE_RHINO/revisions?ingestion=1 > /dev/null

[ $(curl $ARTICLE_RHINO | jq .revisions.\"1\") != "null" ]
	test_true "Article revision"

# make sure SOLR is running

test_up $SOLR_BASE/admin/ping?wt=json "SOLR"

curl $ARTICLE_SOLR | grep $ARTICLE

[ $? -ne 0 ]
	test_true "SOLR should start empty"

# index it (queue)

curl -X POST $ARTICLE_RHINO?solrIndex=anythinggoeshere

sleep 3 # sloppy wait for queue to run job

# force commit the solr index update
curl $SOLR_BASE/update?commit=true

curl $ARTICLE_SOLR | grep $ARTICLE
	test_true "queue/indexer"

# TODO: make some changes that will reflect in the index

# update the index
run_container_once indexerminion
	test_true "minion run"

# force commit the solr index update
curl $SOLR_BASE/update?commit=true

curl $ARTICLE_SOLR | grep $ARTICLE
	test_true "reindex"

# TODO: fetch categories, and repopulate ?
