#!/usr/bin/env bash

# Script to set up: we need this to be dynamic
# and can't necessarily refresh docker images

sudo apt update && sudo apt -y upgrade
sudo apt install -y m4 curl

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install npm and esy
sudo npm install -g esy --unsafe-perm

# Install odig
opam update
opam pin add odig https://github.com/bluddy/odig.git#add_version
opam install -y odig

