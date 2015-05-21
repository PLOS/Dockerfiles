#!/bin/bash

push () {
  NAME=$1
  REPO=$2

  echo         Pushing $NAME to $REPO

  docker tag $NAME $REPO/$NAME
  docker push $REPO/$NAME
  docker rmi $REPO/$NAME
}

HOST=sfo-namedparty-devbox01.int.plos.org
REPO=$HOST:5000

push nedapi:current $REPO
push nedcas:current $REPO
push akita:current $REPO
push mailcatcher:latest $REPO

echo Repo image list:

ssh $REPO /bin/docker-reg-images

