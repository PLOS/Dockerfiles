
source $SCRIPTDIR/../projects/run-helpers.sh

CONFIGS_DIR=$SCRIPTDIR/../configurations

COMPOSE_FILE=$CONFIGS_DIR/$COMPOSE_FILE

HELPER_IMAGE=testhelper

export DOCKERFILES=$SCRIPTDIR/..


function die {
  echo "$@" 1>&2
  exit 1
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
  # cp $SCRIPTDIR/lasttest.log $SCRIPTDIR/lasttest_failure.log
  die "TEST FAILED   $1"
}
