#!/bin/sh
g++ -pthread -std=c++11 src/orca-server-mahimahi.cc src/flow.cc -o orca-server-mahimahi
g++ -std=c++11 src/client.c -o client
g++ -std=c++11 src/clientThr.c -o clientThr
cp client rl-module/
cp clientThr rl-module/
mv orca-server*  rl-module/
sudo chmod +x rl-module/client
sudo chmod +x rl-module/clientThr
sudo chmod +x rl-module/orca-server-mahimahi


