#!/bin/bash

# Delete all untagged images.
echo Deleting untagged images
docker rmi $(docker images -q -f dangling=true)

# Delete all stopped containers.
echo Deleting stopped containers
docker rm $(docker ps -a -q)
