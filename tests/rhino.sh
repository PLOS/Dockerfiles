#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=rhino.yml
SVC_TITLE=rhino

source $SCRIPTDIR/test-helpers.sh

ARTICLE=pone.0099781

cp $SCRIPTDIR/test_data/$ARTICLE.zip $HOME/datastores/ingest

start_stack

SVC_URL=$(get_docker_host):8080

wait_for_web_service $SVC_URL

# begin tests

curl_test_ok $SVC_URL/articles $SVC_TITLE

# ingest and article

curl -X POST -F name="$ARTICLE.zip" $SVC_URL/ingestibles > /dev/null

curl_test_ok $SVC_URL/articles/info:doi/10.1371/journal.$ARTICLE $SVC_TITLE

# publish the article

docker exec -it $(get_container_name rhino) sh -c "echo UPDATE article SET state=0 WHERE doi LIKE \'%$ARTICLE\'|mysql -N -h ambradb -P 3306 -uroot -proot ambra"

PUBLISHED_TEST=$(curl $SVC_URL/articles/info:doi/10.1371/journal.$ARTICLE | bash JSON.sh -b | grep '\[\"state\"\]' | awk '{print $2}' | grep \"published\" | wc -l)

if [[ "$PUBLISHED_TEST" != "1" ]]; then
	die "Article publish failed"
fi




# TODO: get this to work
parse_json "curl $SVC_URL/articles/info:doi/10.1371/journal.$ARTICLE" "state"

# end tests

echo "TESTS PASSED"

stop_stack
