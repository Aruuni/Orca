#!/bin/bash
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo $CURRENT_DIR
echo "Building mahimahi"
sudo apt-get install build-essential git debhelper autotools-dev dh-autoreconf iptables protobuf-compiler libprotobuf-dev pkg-config libssl-dev dnsmasq-base ssl-cert libxcb-present-dev libcairo2-dev libpango1.0-dev iproute2 apache2-dev apache2-bin iptables dnsmasq-base gnuplot iproute2 apache2-api-20120211 libwww-perl
git clone https://github.com/ravinet/mahimahi ~/mahimahi
cd ~/mahimahi
./autogen.sh && ./configure && make
sudo make install
sudo sysctl -w net.ipv4.ip_forward=1
cd $CURRENT_DIR


echo "Setting up python environment"
mkdir ~/venv
virtualenv ~/venv -p python3.7
source ~/venv/bin/activate
pip install gym tensorflow==1.14 sysv_ipc protobuf==3.20.*
python -c "import tensorflow as tf; tf.enable_eager_execution(); print(tf.reduce_sum(tf.random_normal([1000, 1000])))"
deactivate

cd $CURRENT_DIR

echo "Building Orca client and sever"
g++ -pthread -std=c++11 src/orca-server-mahimahi.cc src/flow.cc -o orca-server-mahimahi
g++ -std=c++11 src/client.c -o client
g++ -std=c++11 src/clientThr.c -o clientThr
cp client rl-module/
cp clientThr rl-module/
mv orca-server*  rl-module/
sudo chmod +x rl-module/client
sudo chmod +x rl-module/clientThr
sudo chmod +x rl-module/orca-server-mahimahi


