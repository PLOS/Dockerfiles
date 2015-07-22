#!/bin/bash

SRC=../../../akita/

PROJECT_NAME=akita

TMP_BUILD_CONTAINER=${PROJECT_NAME}_temp_container

DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DOCKER_SETUP_DIR
SRC=$DOCKER_SETUP_DIR/$SRC

docker build -t mailcatcher -f Dockerfile.mailcatcher .

cp Dockerfile $SRC      # this is a hack to allow the Dockerfile to exist in this subfolder
cd $SRC
time docker build -t $PROJECT_NAME:current .
cd $DOCKER_SETUP_DIR
rm $SRC/Dockerfile

# VERSION=$(docker run --rm $PROJECT_NAME:current cat /root/version.txt)

VERSION=$(docker run --volume $DOCKER_SETUP_DIR:/scripts \
						--volume $DOCKER_SETUP_DIR/..:/shared \
						--name $TMP_BUILD_CONTAINER $PROJECT_NAME:current sh -c \
							'cp /shared/run-helpers.sh /scripts/* /root/; 
					     cat /root/version.txt')

# docker commit $TMP_BUILD_CONTAINER $PROJECT_NAME:current
docker commit --change "CMD bash /root/run.sh" $TMP_BUILD_CONTAINER $PROJECT_NAME:current

# tag docker image with asset version number

echo tagging container with version : $VERSION

docker tag -f $PROJECT_NAME:current $PROJECT_NAME:$VERSION

docker rm $TMP_BUILD_CONTAINER
