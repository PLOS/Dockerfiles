#!/bin/bash

if [ -z $DOCKER_REPO_HOST ]; then
  DOCKER_REPO_HOST=sfo-namedparty-devbox01.int.plos.org
fi

if [ -z $DOCKER_REPO_PORT ]; then
  DOCKER_REPO_PORT=5000
fi

REPO=$DOCKER_REPO_HOST:5000

echo Using repository: $REPO

function _get_images_from_config {
  CONFIG_FILE=$1
  echo $(grep '^ *image:' $CONFIG_FILE | sed 's/.*image: *\([^ ][^ ]*\).*$/\1/')
}

# function delete_image {
#   # perhahps this will be implemented in registry 2.1 : https://github.com/docker/distribution/issues/422
#   NAME=$(echo $1 | cut -f1 -d:)
#   TAG=$(echo $1 | cut -f2 -d:)
#   curl -X DELETE --insecure https://${REPO}/v2/${NAME}/manifests/${TAG}
# }

function test_pull {
  IMAGE=$(echo "$(images)" | tail -n1)
  echo Pulling image $IMAGE

  docker pull $REPO/$IMAGE

  if [ "$?" -eq 0 ]; then
    docker rmi $REPO/$IMAGE
    echo "Pull worked"
  else
    echo "Pull failed"
  fi

}

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

  docker tag -f $REPO/$NAME $NAME   # destructively replates local copy
  docker rmi $REPO/$NAME
}

function pull_stack {
  CONFIG_FILE=$1

  # TODO: implement dry run option

  IMAGES=$(_get_images_from_config $CONFIG_FILE)

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

  IMAGES=$(_get_images_from_config $CONFIG_FILE)

  for IMAGE in $IMAGES; do

    CHECK_PLOS_IMAGE=$(docker inspect --format '{{ .Config.Labels.vendor }}' $IMAGE | grep -ci "Public Library of Science")

    if [ $CHECK_PLOS_IMAGE -eq 0 ]; then
      echo "Skipping push of ($IMAGE) since it probably came from dockerhub"
    else
      echo "Pushing ($IMAGE) to $REPO"
      push $IMAGE
    fi

  done;
}

function images {
  echo Repo image list:
  # ssh $DOCKER_REPO_HOST /bin/docker-reg-images
  LIST_URL=$DOCKER_REPO_HOST:5001/images

  HTTP_CODE=$(curl -s -w "%{http_code}\\n" $LIST_URL -o /dev/null)
  if [[ "$HTTP_CODE" -ne "200" ]]; then
    ssh $DOCKER_REPO_HOST find /var/docker-registry/data/docker/registry/v2/repositories -maxdepth 4 | grep _manifests/tags/ | sed 's/^\(\/var\/docker-registry\/data\/docker\/registry\/v2\/repositories\/\)//'| sed 's/\/_manifests\/tags\//:/'|sort
  else
    curl $LIST_URL
  fi
}

if [ "$#" -eq 0 ]; then
  echo "EXAMPLE USE: $0 pull_stack configurations/akita_nedapi_nedcas.yml"
else
  "$@"
fi
