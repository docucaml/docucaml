#!/usr/bin/env bash

# Script to install all packages in OPAM using esy, then create documentation
OCAML_VER=4.08.1
ESY_DIR=$HOME/.esy/3/b
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PKG_DIR=/packages

echo "!!! Running odig !!!"
cd $PKG_DIR
[[ ! -d cache ]] && mkdir cache
[[ ! -d doc ]] && mkdir doc
odig odoc -j 1 --esy-support --libdir=$ESY_DIR --cachedir=$PKG_DIR/cache --docdir=$PKG_DIR/doc

