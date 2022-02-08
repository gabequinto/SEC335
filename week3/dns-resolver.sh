#!/bin/bash

host=$1
server=$2



echo "dns resolution for 10.0.5"
for host in `seq 1 254`; do
(nslookup $1.$host $2) |  awk -F "= " '/name/{print $0}' 
                done 

