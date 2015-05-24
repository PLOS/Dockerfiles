#!/bin/bash

SRC=../../../content-repo/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
SRC=$DIR/$SRC

BASEIMAGE=maven:3.3-jdk-7
MAVEN_CACHE=maven_cache
BUILD_CACHE=repobuild
TMP_BUILD_CONTAINER=repo_temp_container
OUTPUTIMAGE=contentrepo

if [ "$1" == "clean" ]; then
   echo Removing cache
   docker rm $MAVEN_CACHE
   exit 0
fi

# TODO: run tests in build

# create the cache for mavan
docker create -v /build --name $BUILD_CACHE $BASEIMAGE /bin/true

# create the volume for sharing compiled java assets
docker create -v /root/.m2 --name $MAVEN_CACHE $BASEIMAGE /bin/true

# build API war

docker run --rm \
   --volumes-from $MAVEN_CACHE \
   --volumes-from $BUILD_CACHE \
   --volume $SRC:/src \
   --volume $DIR:/scripts $BASEIMAGE \
   bash /scripts/compile.sh

# build docker images

docker build -t $OUTPUTIMAGE:current .

VERSION=$(docker run --volumes-from $BUILD_CACHE --name $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current bash -c 'cp /build/* /root; cat /root/version.txt')

docker commit $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current

# tag docker image with asset version number

echo tagging container with version : $VERSION

docker tag -f $OUTPUTIMAGE:current $OUTPUTIMAGE:$VERSION

docker rm $TMP_BUILD_CONTAINER
