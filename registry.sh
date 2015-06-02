#!/bin/bash

if [ -z $DOCKER_REPO_HOST ]; then
  DOCKER_REPO_HOST=sfo-namedparty-devbox01.int.plos.org
fi

if [ -z $DOCKER_REPO_PORT ]; then
  DOCKER_REPO_PORT=5000
fi

REPO=$DOCKER_REPO_HOST:5000

echo Using repository: $REPO

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
  if [ $? -ne 0 ]; then
    return 1;
  fi

  docker tag -f $REPO/$NAME $NAME # destructively replates local copy
  docker rmi $REPO/$NAME
}

function pull_stack {
  CONFIG_FILE=$1
  IMAGES=$(grep 'image:' $CONFIG_FILE | sed 's/\s*image:\s*//')
  echo "Images to pull: $IMAGES"

  for IMAGE in $IMAGES; do

    # first look to the repo
    echo "Pulling $IMAGE from $REPO"
    pull $IMAGE

    # then look at dockerhub
    if [ $? -ne 0 ]; then
      echo "Image not found in repo looking in dockerhub"
      docker pull $IMAGE
    fi

  done;
}

function push_stack {
  CONFIG_FILE=$1
  IMAGES=$(grep 'image:' $CONFIG_FILE | sed 's/\s*image:\s*//')
  echo "Images to push: $IMAGES"

  for IMAGE in $IMAGES; do

    PROJECTNAME=$(echo $IMAGE | sed 's/:.*$//')

    # see if the project is one of ours. dont push ones that came from dockerhub
    # TODO: fix this such that it pushes things like mailcatcher

    CHECK_OURS=$(grep " ${PROJECTNAME} " $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/projects/*/build-image.sh | wc -l)

    if [ $CHECK_OURS -eq 0 ]; then
      echo "Skipping push of $IMAGE since it looks like it came from dockerhub"
    else
      echo "Pushing $IMAGE to $REPO"
      push $IMAGE
    fi

  done;
}

function list_images {
  echo Repo image list:
  ssh $DOCKER_REPO_HOST /bin/docker-reg-images
}

if [ "$#" -eq 0 ]; then
  echo "EXAMPLE USE: $0 pull_stack configurations/akita_nedapi_nedcas.yml"
else
  "$@"
fi
