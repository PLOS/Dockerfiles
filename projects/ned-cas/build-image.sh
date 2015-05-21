#!/bin/bash

SRC=../../../ned-cas/

BASEIMAGE=maven:3.3-jdk-8
MAVEN_CACHE=maven_cache
BUILD_CACHE=nedcasbuild
TMP_BUILD_CONTAINER=ned_temp_container
OUTPUTIMAGE=nedcas

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
SRC=$DIR/$SRC

if [ "$1" == "clean" ]; then
   echo Removing cache
   docker rm $MAVEN_CACHE
   exit 0
fi

# create build caches if they do not exist

docker inspect $BUILD_CACHE > /dev/null
[ $? -eq 1 ] && docker create -v /build --name $BUILD_CACHE $BASEIMAGE /bin/true

docker inspect $MAVEN_CACHE > /dev/null
[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_CACHE $BASEIMAGE /bin/true

# build API war

docker run --rm \
   --volumes-from $MAVEN_CACHE \
   --volumes-from $BUILD_CACHE \
   --volume $SRC:/src \
   $BASEIMAGE bash /src/docker/compile.sh

docker build -t $OUTPUTIMAGE:current .

# copy over built assets

VERSION=$(docker run --volumes-from $BUILD_CACHE --name $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current bash -c 'cp /build/* /root; cat /root/version.txt')

docker commit $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current

# tag docker image with asset version number

echo tagging container with version : $VERSION

docker tag -f $OUTPUTIMAGE:current $OUTPUTIMAGE:$VERSION

docker rm $TMP_BUILD_CONTAINER
