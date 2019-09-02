#!/usr/bin/env bash

# Script to set up: we need this to be dynamic
# and can't necessarily refresh docker images

sudo apt update && sudo apt -y upgrade
sudo apt install -y m4 curl pkgconf autoconf cmake bmake

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install npm and esy
sudo npm install -g esy --unsafe-perm

# Install odig
opam update
opam pin add odoc https://github.com/bluddy/odoc.git#fix
opam pin add odig https://github.com/bluddy/odig.git#add_version
opam install -y odig

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig/

# Install all conf packages
CONF_PACKAGES=$(opam list -a 'conf-*' | tail -n +3 | awk '{print $1}')
for package in $CONF_PACKAGES; do
  echo "!!!! Installing via opam $package !!!!"
  opam depext -y $package
done
