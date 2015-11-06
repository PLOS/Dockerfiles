#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

set -e

FILES=`ls */build-image.sh`
for FILE in $FILES
do
  echo RUNNING $FILE
  bash $FILE
done;
