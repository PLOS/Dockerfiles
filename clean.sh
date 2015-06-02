#!/bin/bash

function delete_untagged_images {
  echo Deleting untagged images
  docker rmi $(docker images -q -f dangling=true)
}

function delete_stopped_containers {
  echo Deleting stopped containers
  docker rm $(docker ps -a -q) 
}

function delete_all_images {
  echo Deleteding all images
  docker rmi $(docker images -q)
}

function kill_all_containers {
  echo Killing all running containers
  docker kill $(docker ps -q)
}

function clean {
  delete_untagged_images
  delete_stopped_containers
}

if [ "$#" -eq 0 ]; then
  echo "EXAMPLE USE: $0 clean"
  # echo "Available methods: "
  # grep "^function" $0
else
  "$@"
fi
