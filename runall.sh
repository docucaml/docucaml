#!/usr/bin/env bash

#time ./setup1.sh 2>&1 | tee log_setup1.txt
#time ./setup2.sh 2>&1 | tee log_setup2.txt
#time ./setup3.sh 2>&1 | tee log_setup3.txt
time ./run_esy.sh 2>&1 | tee log_esy.txt
time ./run_odig.sh 2>&1 | tee log_odig.txt

