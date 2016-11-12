#!/usr/bin/env bash

set -x

source /dockerfiles/tests/test-helpers.sh

wait_for_web_service contentrepo:8080 "Content repo"
wait_for_web_service rhino:8080 "Rhino"

# begin tests

ARTICLE=pone.0099781

SOLR_BASE=http://solr:8080/solr/collection1

ARTICLE_RHINO=rhino:8080/articles/10.1371++journal.$ARTICLE

ARTICLE_SOLR="$SOLR_BASE/select?q=10.1371%2Fjournal.$ARTICLE&wt=json&indent=true"

# ingest an article

curl -X POST --form "archive=@/dockerfiles/tests/test_data/accman/$ARTICLE.zip" rhino:8080/articles  > /dev/null
# TODO: should return 201 ?

# TODO; check return code of POST, and other POSTs in this test

[[ $(curl $ARTICLE_RHINO | jq .ingestions.\"1\") != "null" ]]
	test_true "Article ingestion"

# create a revision

curl -X POST $ARTICLE_RHINO/revisions?ingestion=1 # > /dev/null

curl $ARTICLE_RHINO
curl $ARTICLE_RHINO | jq .revisions.\"1\"

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

# sleep 2

curl $ARTICLE_SOLR

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


# frontend tests

wait_for_web_service wombat:8080 "wombat"

# sloppy test to make sure plos-themes loaded
curl wombat:8082/DesktopPlosOne | grep -q "plos.org"
	test_true "plos themes loaded"

test_up wombat:8080/DesktopPlosOne/article?id=10.1371/journal.$ARTICLE "Wombat article"
