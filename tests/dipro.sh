#!/usr/bin/env bash

# set -x

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=dipro.yml
RHINO_TITLE=rhino
WOMBAT_TITLE=wombat
AMBRA_TITLE=ambra

source $SCRIPTDIR/test-helpers.sh

ARTICLE=pone.0099781

cp $SCRIPTDIR/test_data/$ARTICLE.zip $HOME/datastores/ingest

start_stack

DOCKER_HOST=$(get_docker_host)
RHINO_URL=$DOCKER_HOST:8080
WOMBAT_URL=$DOCKER_HOST:8081
AMBRA_URL=$DOCKER_HOST

wait_for_web_service $RHINO_URL $RHINO_TITLE
wait_for_web_service $WOMBAT_URL $WOMBAT_TITLE
wait_for_web_service $AMBRA_URL $AMBRA_TITLE

# begin tests
curl_test_ok $RHINO_URL/articles $RHINO_TITLE
curl_test_ok $WOMBAT_URL/DesktopPlosOne/ $WOMBAT_TITLE

curl -X POST -s -F name="$ARTICLE.zip" $RHINO_URL/ingestibles >/dev/null #2>&1

docker exec -it $(get_container_name rhino) sh -c "echo UPDATE article SET state=0 WHERE doi LIKE \'%$ARTICLE\'|mysql -N -h ambradb -P 3306 -uroot -proot ambra"

curl_test_ok $WOMBAT_URL/DesktopPlosOne/article?id=10.1371/journal.$ARTICLE "$WOMBAT_TITLE article"

curl_test_ok $AMBRA_URL/article/Authors/info:doi/10.1371/journal.$ARTICLE "$AMBRA_TITLE article authors"
curl_test_ok $AMBRA_URL/article/Comments/info:doi/10.1371/journal.$ARTICLE "$AMBRA_TITLE article comments"
curl_test_ok $AMBRA_URL/article/Related/info:doi/10.1371/journal.$ARTICLE "$AMBRA_TITLE article related"

tests_passed

stop_stack
