#!/bin/bash

SRC=../../../akita/

PROJECT_NAME=akita

TMP_BUILD_CONTAINER=${PROJECT_NAME}_temp_container

DOCKER_SETUP_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DOCKER_SETUP_DIR
SRC=$DOCKER_SETUP_DIR/$SRC

docker build -t mailcatcher -f Dockerfile.mailcatcher .

cp Dockerfile $SRC      # this is a hack to allow the Dockerfile to exist in this subfolder
cp akita.dockerignore $SRC/.dockerignore

# if you pass the "clean" argument, the build will ignore the frontend dependencies that are on your host machine, and pull them down fresh in the container
if [ "$1" == "clean" ]; then
	echo -e "frontend/dist\nfrontend/node_modules\nfrontend/bower_components\n" >> $SRC/.dockerignore
fi

cat $SRC/.dockerignore

cd $SRC
time docker build -t $PROJECT_NAME:current .
# cd $DOCKER_SETUP_DIR
rm $SRC/Dockerfile
rm $SRC/.dockerignore

VERSION=$(docker run --volume $DOCKER_SETUP_DIR:/scripts \
						--volume $DOCKER_SETUP_DIR/..:/shared \
						--name $TMP_BUILD_CONTAINER $PROJECT_NAME:current sh -c \
							'cp /shared/run-helpers.sh /scripts/* /root/;
					     cat /root/version.txt')

docker commit --change "CMD bash /root/run.sh" $TMP_BUILD_CONTAINER $PROJECT_NAME:current

# tag docker image with asset version number

echo tagging container with version : $VERSION

docker tag -f $PROJECT_NAME:current $PROJECT_NAME:$VERSION

docker rm $TMP_BUILD_CONTAINER
