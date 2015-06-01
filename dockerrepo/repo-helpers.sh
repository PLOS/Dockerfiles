#!/bin/bash

HOST=sfo-namedparty-devbox01.int.plos.org
REPO=$HOST:5000

function push {
  NAME=$1
  # REPO=$2

  echo Pushing $NAME to $REPO

  docker tag $NAME $REPO/$NAME
  docker push $REPO/$NAME
  docker rmi $REPO/$NAME
}

function pull {
  NAME=$1

  echo Pulling $NAME from $REPO

  docker pull $REPO/$NAME
  docker tag -f $REPO/$NAME $NAME # destructively replates local copy
  docker rmi $REPO/$NAME
}

function list_images {
  echo Repo image list:
  ssh $HOST /bin/docker-reg-images
}
