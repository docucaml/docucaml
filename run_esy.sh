#!/usr/bin/env bash

# Script to install all packages in OPAM using esy, then create documentation
OCAML_VER=4.08.1
ESY_DIR=$HOME/.esy/3/b
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PKG_DIR=/packages
export ESYI__OPAM_OVERRIDE=:/esy_opam_override
export ESYI__OPAM_REPOSITORY=:/opam-repository

[[ ! -d $PKG_DIR ]] && mkdir $PKG_DIR
cd $PKG_DIR

echo "!!!! Running esy !!!!"
# Get the list of available opam packages
PACKAGES=$(opam list -a --coinstallable-with=ocaml.$OCAML_VER | tail -n +3 | awk '{print $1}')

# Debug conf packages
#PACKAGES=$(opam list -a 'conf-libpcre' | tail -n +3 | awk '{print $1}')

#PACKAGES='mrmime emile'

for package in $PACKAGES; do

  # Don't install conf-packages
  [[ $package =~ ^conf-.* ]] && continue
  [[ $package == ldap ]] && continue
  [[ $package == links ]] && continue
  [[ $package == rotor ]] && continue

  cd $PKG_DIR
  echo "!!!! Installing $package !!!!"
  [[ ! -d ${package}_inst ]] && mkdir ${package}_inst
  cd ${package}_inst
  cp $CURDIR/package.json .
  cp $CURDIR/dune .
  cp $CURDIR/test.ml .
  esy add @opam/dune
  esy add @opam/${package}
  esy install
  esy build
done
