#!/bin/bash

SRC=../../../akita/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
SRC=$DIR/$SRC

docker build -t mailcatcher -f Dockerfile.mailcatcher .

# this is a hack to allow the Dockerfile to exist in this subfolder

echo SRC: $SRC

cp Dockerfile $SRC
time docker build -t akita:current $SRC
rm $SRC/Dockerfile

VERSION=$(docker run --rm akita:current cat /root/version.txt)

echo building AKITA version $VERSION

docker tag -f akita:current akita:$VERSION
