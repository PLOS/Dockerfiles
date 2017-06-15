#!/usr/bin/env bash

set -x

source /envoy/test-helpers.sh

wait_for_web_service contentrepo:8080 "Content repo"
wait_for_web_service rhino:8080 "Rhino"

# begin tests

ARTICLE=pone.0153419

ARTICLE_RHINO=rhino:8080/articles/10.1371++journal.$ARTICLE

test_up rhino:8080/journals "Rhino journals"

# ingest an article

curl -X POST --form "archive=@/dockerfiles/tests/test_data/demo/$ARTICLE.zip" rhino:8080/articles > /dev/null
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

wait_for_web_service wombat:8080 "wombat"

# frontend test for rendering article

test_up wombat:8080/article?id=10.1371/journal.$ARTICLE "Wombat article"
