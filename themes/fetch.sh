#!/usr/bin/env bash

set -x
set -e

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# TODO: handle update case better?

if [[ "$1" == "clean" ]]; then
  rm -rf minimal plos-example-themes plos-themes
  exit 0
fi

if [ "$#" -eq 0 ] || [[ "$1" == "minimal" ]]; then

  echo Fetching minimal themes...

  if [[ -d "minimal" ]]; then
    echo minimal directory already exists. Delete before fetching if you want.
  else
    curl https://plos.github.io/ambraproject/example/themes.tar.gz | tar xz && mv themes minimal
  fi

fi

if [ "$#" -eq 0 ] || [[ "$1" == "plos-example-themes" ]]; then

  echo Fetching example plos themes...

  if [[ -d "plos-example-themes" ]]; then
    echo plos-example-themes directory already exists. Delete before fetching if you want.
  else
    curl http://downloads.ambraproject.org/releases/plos-example-themes.tar.gz | tar xz
  fi

fi

if [ "$#" -eq 0 ] || [[ "$1" == "plos-themes" ]]; then

  echo Fetching production plos themes, if you have permission...

  # TODO: check git permissions before the pull or clone

  if [[ -d "plos-themes" ]]; then
    echo plos-themes directory already exists. Delete before fetching if you want.
  else
    git clone git@github.com:PLOS/plos-themes
  fi

fi
