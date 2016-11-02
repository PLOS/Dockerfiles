#!/bin/bash

# set -x

BUILDDIR="/build"

# TODO: run tests in build


function die() {
  echo "$@" 1>&2
  exit 1
}

function compile_prepare {

  rm -rf $BUILDDIR/*

  echo Compiling

  cd /src
  mkdir /root/src

  # bing in the source code
  cp -r `ls -A | grep -Ev ".git|.idea|target"` /root/src
  cd /root/src

  # bring in the supporting dockerfiles scripts needed for run time
  cp /scripts/* $BUILDDIR
  cp /shared/run-helpers.sh $BUILDDIR

  pwd
  du -sh
  # ls -la
}

function maven_fetch_version {

  PROPERTIES_FILE=$1

  grep ^version= $PROPERTIES_FILE | head -1 | sed 's/^version=//' > $BUILDDIR/version.txt

  # ls -lh $BUILDDIR
}
