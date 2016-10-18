
# source /projects/run-helpers.sh

# function die {
#   echo "$@" 1>&2
#   exit 1
# }

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


function wait_for_web_service {

  URL=$1
  NAME=$2
  TEST_CMD="curl -skI $URL -o /dev/null"
  TEST_RETURN_CODE=1
  TRY_COUNT=0
  MAX_TRIES=50

  while [ $TEST_RETURN_CODE -ne 0 ] ; do
    sleep 3
    $TEST_CMD
    TEST_RETURN_CODE=$?
    echo "Service $NAME ($URL) not ready ... waiting"

    ((TRY_COUNT++))
    if [ $TRY_COUNT -gt $MAX_TRIES ]; then
      die "Service did not respond in a reasonable amount of time"
    fi

  done;

  echo "Service $NAME ($URL) is up and ready for tests"
}

function run_container_once {
  # so we can run a container from inside another container! DOCKERCEPTION
  IMAGE=$1
  DOCKERFILES=/dockerfiles docker-compose -f /dockerfiles/configurations/common.yml run --rm $IMAGE
}

# function tests_passed {
#   echo "TESTS PASSED"
# }
#
# function tests_failed {
#   # cp $SCRIPTDIR/lasttest.log $SCRIPTDIR/lasttest_failure.log
#   die "TEST FAILED   $1"
# }
