#!/bin/bash

SRC=../../../akita/

PROJECTNAME=akita

TMP_BUILD_CONTAINER=${PROJECTNAME}_temp_container

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
SRC=$DIR/$SRC

docker build -t mailcatcher -f Dockerfile.mailcatcher .

cp Dockerfile $SRC      # this is a hack to allow the Dockerfile to exist in this subfolder
cd $SRC
time docker build -t $PROJECTNAME:current .
cd $DIR
rm $SRC/Dockerfile

# VERSION=$(docker run --rm $PROJECTNAME:current cat /root/version.txt)

VERSION=$(docker run --volume $DIR:/scripts \
                     --volume $DIR/..:/shared \
                     --name $TMP_BUILD_CONTAINER $PROJECTNAME:current \
                     sh -c 'cp /shared/run-helpers.sh /root/; 
                            cp /scripts/run.sh /root/;
                            chmod 755 /root/run.sh;
                            cat /root/version.txt')

docker commit $TMP_BUILD_CONTAINER $PROJECTNAME:current

# tag docker image with asset version number

echo tagging container with version : $VERSION

docker tag -f $PROJECTNAME:current $PROJECTNAME:$VERSION

docker rm $TMP_BUILD_CONTAINER
