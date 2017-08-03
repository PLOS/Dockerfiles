#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

mkdir $BUILDDIR/rails
mv /root/src/frontend /tmp/frontend
mv /root/src/* $BUILDDIR/rails

cd /tmp/frontend

# NOTE: node:6 already has yarn installed
# yarn --version || npm install -g yarn

# only run the setup if the dependencies are missing
du -sh node_modules || bin/setup

ls dist || ./node_modules/.bin/ember build --environment=production

cp -r dist $BUILDDIR/ember

cp package.json $BUILDDIR

echo `node -e "var fs = require('fs');console.log(JSON.parse(fs.readFileSync('package.json', 'utf8'))['version']);"` > $BUILDDIR/version.txt
