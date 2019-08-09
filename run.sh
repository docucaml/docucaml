#!/usr/bin/env bash

# Script to install all packages in OPAM using esy, then create documentation
OCAML_VER=4.08.1
ESY_DIR=$HOME/.esy/3/b
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir ~/packages
cd ~/packages

# Get the list of available opam packages
PACKAGES=$(opam list -a --coinstallable-with=ocaml.$OCAML_VER | awk '{print $1}')
for package in $PACKAGES; do
  echo Installing $package
  mkdir ${package}_inst
  cd ${package}_inst
  cp $CURDIR/package.json .
  esy add @opam/${package}
  esy install
  esy build
done

cd ~/packages
mkdir cache
mkdir doc
odig odoc --esy-support --libdir=$ESY_DIR --cachedir=$HOME/packages/cache --docdir=$HOME/packages/doc

