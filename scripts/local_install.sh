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

# Change the run script to be executable
chmod 700 run.sh 

# Run Lprime against the first candidate
./run.sh $(head -n 1)

