#!/bin/bash

ips=$1
port=$2

echo "ip,port"
for ip in `seq 1 254`; do
        timeout .1 bash -c "echo >/dev/tcp/$1.$ip/$port" 2>/dev/null &&
                        echo "$1.$ip,$port" 
                done
