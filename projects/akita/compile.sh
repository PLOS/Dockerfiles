#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

cd frontend

# only run the setup if the dependencies are missing
ls node_modules || bin/setup

./node_modules/.bin/ember build --environment=production

cp . $BUILDDIR    # too much

mv dist $BUILDDIR

# maven_fetch_version "target/maven-archiver/pom.properties"

echo `node -e "var fs = require('fs');console.log(JSON.parse(fs.readFileSync('package.json', 'utf8'))['version']);"` > $BUILDDIR/version.txt
