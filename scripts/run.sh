#!/bin/bash

N_VALUE=$1
{ time ./build-output/lprime -n $N_VALUE; } 2>&1 | tee  results.txt &
