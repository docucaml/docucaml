#!/usr/bin/env bash

./setup.sh 2>&1 | tee setup.txt
./run.sh 2>&1 | tee run.txt

