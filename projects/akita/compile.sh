#!/usr/bin/env bash

source /envoy/compile-helpers.sh

compile_prepare

cd frontend

# only run the setup if the dependencies are missing
ls node_modules || bin/setup

./node_modules/.bin/ember build --environment=production

mv dist $BUILDDIR

# maven_fetch_version "target/maven-archiver/pom.properties"

# echo `ruby -rjson -e 'puts JSON.parse(File.read("/src/frontend/package.json"))["version"]'` > $BUILDDIR/version.txt
