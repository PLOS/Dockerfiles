#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

# mkdir $BUILDDIR/rails
# mv /root/src/frontend /tmp/frontend
# mv /root/src/* $BUILDDIR/rails

# SRC /home/app/lagotto

mkdir $SRC
cd $SRC

cd /tmp/frontend

# only run the setup if the dependencies are missing

ls node_modules || npm install

# cp package.json $BUILDDIR

# echo `node -e "var fs = require('fs');console.log(JSON.parse(fs.readFileSync('package.json', 'utf8'))['version']);"` > $BUILDDIR/version.txt

# echo "require './config/initializers/version.rb'; puts Lagotto::VERSION" | ruby > $BUILD_DIR/version.txt

grep -o '".*"' ./config/initializers/version.rb | sed 's/"//g' > $BUILD_DIR/version.txt
