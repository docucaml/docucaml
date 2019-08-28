#!/usr/bin/env bash

time ./setup.sh 2>&1 | tee log_setup.txt
time ./run_esy.sh 2>&1 | tee log_esy.txt
time ./run_odig.sh 2>&1 | tee log_odig.txt

