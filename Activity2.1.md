# Activity 2.1 : Host Discovery
------

### Host-Discovery
------
This section will include all of the bash scripts/one liners or different commands that were used in this activity

Our first task was to write a script that pinged the ip's in the range 10.0.5.2-50 and pull out the ip's that responed to the ping. After this we had to appened these ip's to a file called sweep.txt. The following is my script to complete this task:

```bash
#!/bin/bash

for ip in $(seq 2 50); do ping -c 1 10.0.5.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 | tee -a swee.txt

done
```
Following this we were tasked with doing the same thing as above except instead of using ping we used fping. The following is the script I used to complete this task:

```bash
!#/bin/bash

for ip in $(seq 2 50); do fping -c 1 10.0.5.$ip | grep "64 bytes" | awk '{ print $1 }' | tee -a sweep2.txt

done
```
For the final task, we had to conduct an nmap -sn scan that scanned the same ip address range as above. We also had to parse the ip addresses of hosts that were up and than appened them to sweep3.txt. The following is my one liner for that:

` sudo nmap -n -vv -sn 10.0.5.2-50 -oG - | awk '/Up$/{print $2}' > sweep3.txt` 
### Notes
------
The bash parts of this lab were pretty tough for me. I hadn't used bash in about 5 months prior to this lab so just getting back into it was pretty tough. Once I refreshed myself on the basics it wasn't hard to complete this activity. 
###### Things to remember 
* nmap: Run as sudo 
* nmap: -sn disables port scanning
* nmap: -n stops DNS resolution


