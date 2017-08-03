#!/usr/bin/env bash

set -e

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# to clean out and start fresh: rm -rf minimal plos-*

# TODO: handle update case better?

echo Fetching minimal themes...

if [[ -d "minimal" ]]; then
  echo minimal directory already exists. Delete before fetching if you want.
else
  wget -O - https://plos.github.io/ambraproject/example/themes.tar.gz | tar xz && mv themes minimal
fi

echo Fetching example plos themes...

if [[ -d "plos-example-themes" ]]; then
  echo plos-example-themes directory already exists. Delete before fetching if you want.
else
  wget -O - http://downloads.ambraproject.org/releases/plos-example-themes.tar.gz | tar xz
fi

echo Fetching production plos themes, if you have permission...

# TODO: check git permissions before the pull or clone

if [[ -d "plos-themes" ]]; then
  echo plos-themes directory already exists. Delete before fetching if you want.
else
  git clone git@github.com:PLOS/plos-themes
fi
