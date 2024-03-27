#!/bin/bash

# Update and install necessary dependencies 
sudo apt update 
sudo apt install libgmp-dev make gcc -y 

# Clone and install the Lprime project
cd ~
git clone github.com/davidsenack/lprime.git
cd lprime
make test
sudo make install

# Run Lprime against the first candidate
# and send result to results.txt
{ time -v lprime -n $(head -n 1) } 2>&1 | tee results.txt
