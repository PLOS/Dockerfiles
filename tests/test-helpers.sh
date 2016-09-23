
source $SCRIPTDIR/../projects/run-helpers.sh

CONFIGS_DIR=$SCRIPTDIR/../configurations

COMPOSE_FILE=$CONFIGS_DIR/$COMPOSE_FILE

export DOCKERFILES=$SCRIPTDIR/..

# TODO: build images if not found

function die {
  echo "$@" 1>&2
  stop_stack
  exit 1
}

function get_docker_host {
  HOST="localhost"

  if boot2docker ip >/dev/null 2>&1 ; then
    HOST=$(boot2docker ip)
  elif docker-machine ip >/dev/null 2>&1 ; then
    HOST=$(docker-machine ip)
  fi

  echo $HOST
}

function parse_json {
  INPUT=$1
  LOOK_FOR="\[$2\]"

  echo "$($INPUT | bash $SCRIPTDIR/JSON.sh -b | sed 's/\"//g' | grep $LOOK_FOR | awk '{print $2}')"
}

function get_container_name {
  CONTAINER_BASENAME=$1

  # CONTAINER=$(docker-compose -f $COMPOSE_FILE ps | grep $CONTAINER_BASENAME | awk 'END {print $1}')

  # workaround because the previous line does not work yet.
  # see: https://github.com/docker/compose/issues/1513

  echo $(docker inspect -f '{{if .State.Running}}{{.Name}}{{end}}' $(docker-compose -f $COMPOSE_FILE ps -q) | sed 's/^\///' | grep $CONTAINER_BASENAME)
}

function start_stack {
  docker-compose -f $COMPOSE_FILE up -d
  docker-compose -f $COMPOSE_FILE logs --no-color > $SCRIPTDIR/lasttest.log &
}

function stop_stack {
  docker-compose -f $COMPOSE_FILE kill
  docker-compose -f $COMPOSE_FILE rm -f
}

function run_once {
  IMAGE=$1
  docker-compose -f $CONFIGS_DIR/common.yml run $IMAGE
}

function wait_and_curl {
  BASEURL=$1
  ROUTE=$2
  TITLE=$3
  # CREDS=$4

  wait_for_web_service $BASEURL $TITLE
  curl_test_ok ${BASEURL}${ROUTE} $TITLE $4
}

function curl_test_ok {

  URL=$1
  TITLE=$2
  CREDS=$3
  echo "Testing $TITLE -> $URL"

  HTTP_CODE=$(curl -Lk $CREDS -w "%{http_code}\\n" -s -o /dev/null $URL)
  if [[ "$HTTP_CODE" -ne "200" ]]; then
    tests_failed "status code = $HTTP_CODE"
  fi
}

function tests_passed {
  echo "TESTS PASSED"
}

function tests_failed {
  cp $SCRIPTDIR/lasttest.log $SCRIPTDIR/lasttest_failure.log
  die "TEST FAILED   $1"
}
