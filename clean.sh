#!/usr/bin/env bash

function delete_untagged_images {
  echo Deleting untagged images
  docker rmi $(docker images -q -f dangling=true)
}

function delete_stopped_containers {
  echo Deleting stopped containers
  docker rm $(docker ps -a -q)
}

function delete_all_images {
  echo Deleting all images
  docker rmi $(docker images -q)
}

function delete_unused_volumes {
  echo Deleting old volumes
  docker volume rm $(docker volume ls -qf dangling=true)
}

function kill_all_containers {
  echo Killing all running containers
  docker kill $(docker ps -q)
}

function basic {
  delete_unused_volumes
  delete_untagged_images
  delete_stopped_containers
}

if [ "$#" -eq 0 ]; then
  echo "EXAMPLE USE: $0 delete_untagged_images"
  # echo "Available methods: "
  # grep "^function" $0
else
  "$@"
fi
