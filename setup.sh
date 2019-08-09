#!/usr/bin/env bash

# Script to set up: we need this to be dynamic
# and can't necessarily refresh docker images

sudo apt update
sudo apt install -y npm m4

# Install npm and esy
sudo npm install npm@latest -g
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g esy --unsafe-perm

# Install odig
opam update
opam pin add odig https://github.com/bluddy/odig.git#add_version
opam install -y odig

