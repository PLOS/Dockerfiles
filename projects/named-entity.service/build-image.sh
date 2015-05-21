#!/bin/bash

SRC=../../../../named-entity.service/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
SRC=$DIR/$SRC

BASEIMAGE=maven:3.3-jdk-8
MAVEN_CACHE=maven_cache
NED_BUILD=nedbuild
OUTPUTIMAGE=nedapi
# CWD=`pwd`
HOST_CACHE=$DIR/build_cache

if [ "$1" == "clean" ]; then
   echo Removing cache
   docker rm $MAVEN_CACHE
   exit 0
fi

# TODO: run tests in build

# create the cache for mavan
docker create -v /build --name $NED_BUILD $BASEIMAGE /bin/true

# create the volume for sharing compiled java assets
docker create -v /root/.m2 --name $MAVEN_CACHE $BASEIMAGE /bin/true

# build API war
docker run -it \
   --volumes-from $MAVEN_CACHE \
   --volumes-from $NED_BUILD \
   --volume $SRC:/src \
   --volume $DIR:/scripts $BASEIMAGE \
   bash /scripts/build_ned.bash

# build ETL jar
docker run -it \
   --volumes-from $MAVEN_CACHE \
   --volumes-from $NED_BUILD \
   --volume $SRC/named-entity.etl:/src \
   --volume $DIR:/scripts $BASEIMAGE \
   bash /scripts/build_etl.bash

# build docker images and tag them
mkdir $HOST_CACHE

# TODO: see if these volumes can be shared without using the host

docker run --volumes-from $NED_BUILD -v $HOST_CACHE:/export $BASEIMAGE bash -c 'cp /build/* /export'

VERSION=`grep ^version= $HOST_CACHE/ned.version.properties | head -1 | sed 's/^version=//'`

echo tagging container with version : $VERSION

docker build -t $OUTPUTIMAGE:$VERSION .
docker tag -f $OUTPUTIMAGE:$VERSION $OUTPUTIMAGE:current
