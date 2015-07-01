#!/bin/sh

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

COMPOSE_FILE=plos.yml
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

wait_for_web_service $RHINO_URL
wait_for_web_service $WOMBAT_URL
wait_for_web_service $AMBRA_URL

# begin tests
curl_test_ok $RHINO_URL/articles $RHINO_TITLE
curl_test_ok $WOMBAT_URL/DesktopPlosOne $WOMBAT_TITLE

curl -X POST -F name="$ARTICLE.zip" $RHINO_URL/ingestibles

# TODO: get config_rhino_1 via helper function
docker exec -it $(get_container_name rhino) sh -c "echo UPDATE article SET state=0 WHERE doi LIKE \'%$ARTICLE\'|mysql -N -h ambradb -P 3306 -uroot -proot ambra"

# echo "update article set state=0 where doi like '%$ARTICLE'" | mysql -h $DOCKER_HOST -P 3306 -uroot -proot ambra
# curl_test_ok $RHINO_URL/articles/info:doi/10.1371/journal.pone.0099781 $RHINO_TITLE
#
# state=$(echo "select state from article where doi like '%pone.0099781'" | mysql -h $DOCKER_HOST -P \
# 3306 -uroot -proot ambra | grep 0)
#
# if [ "$state" != "0" ]
# then
#   die "Article publish failed"
# fi

curl_test_ok $AMBRA_URL/article/Authors/info:doi/10.1371/journal.$ARTICLE $AMBRA_TITLE
curl_test_ok $AMBRA_URL/article/Comments/info:doi/10.1371/journal.$ARTICLE $AMBRA_TITLE
curl_test_ok $AMBRA_URL/article/Related/info:doi/10.1371/journal.$ARTICLE $AMBRA_TITLE

# end tests
echo "TESTS PASSED"

stop_stack
