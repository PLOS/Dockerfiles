#!/bin/bash

PROJECTNAME=contentrepo
PROJECTDIR=content-repo

BASEIMAGE=maven:3.3-jdk-7

SRC=../../../${PROJECTDIR}/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC=$DIR/$SRC

cd $DIR
source ../build-helpers.sh

build_java_service_images

# build mogile images
docker build -t mogiletracker mogiletracker
docker build -t mogilenode mogilenode
