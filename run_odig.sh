#!/usr/bin/env bash

# Script to install all packages in OPAM using esy, then create documentation
OCAML_VER=4.08.1
OCAML_VER_SHORT=4.08
ESY_DIR=$HOME/.esy/3/i
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PKG_DIR=/packages

opam update
opam upgrade -y

echo "!!! Running odig !!!"
cd $PKG_DIR
[[ ! -d cache ]] && mkdir cache
[[ ! -d doc ]] && mkdir doc
# Create file with list of capitalized names
opam list -a | awk '{print $1}' | grep '\w*[A-Z]\w*' > ./opam_caps.txt
odig odoc -j 1 --esy-mode --libdir=$ESY_DIR --cachedir=$PKG_DIR/cache --docdir=$PKG_DIR/doc --sharedir=$HOME/.opam/$OCAML_VER_SHORT/share

