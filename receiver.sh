#!/bin/bash
ip=$1
port=$2
flow_id=$3
path=$4
echo $path
$path/rl-module/clientThr ${ip} ${flow_id} ${port} 1

