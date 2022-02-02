```bash
#!/bin/bash

hostfile=$1
portfile=$2

echo "Please enter the file type you would like to save the output as. Ex. '.txt'"
read ext

if [[$ext != .* ]]
then
    echo "Please add a "." followed by the desired file extension Ex. '.txt'"
    exit 1
fi

if [[ $# -eq 0 ]]
then 
    echo "Please specify a host file and port file."
    exit 1
fi

echo "host,port"
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port" | tee -a goodsocket$ext
    done
 done

```
