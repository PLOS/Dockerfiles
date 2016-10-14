#!/bin/bash

# set -x

BUILDDIR="/build"

# TODO: run tests in build


function die() {
  echo "$@" 1>&2
  exit 1
}

function java_compile_prepare {

  rm $BUILDDIR/*

  echo Compiling

  cd /src
  mkdir /root/src
  cp -r `ls -A | grep -Ev ".git|.idea|target"` /root/src
  cd /root/src
  pwd
  du -sh
  ls -la
}

function java_compile_finish {

  PROPERTIES_FILE=$1

  cp /scripts/* $BUILDDIR
  cp /shared/run-helpers.sh $BUILDDIR

  grep ^version= $PROPERTIES_FILE | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

  ls -lh $BUILDDIR

}
