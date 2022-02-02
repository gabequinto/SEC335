### Port Scanning 1
------
For this lab we were port scanning with Nmap and Wireshark. We first ran the command `bash -c "echo >/dev/tcp/10.0.5.20/80"` while recording in wireshark to be 
able to view the TCP flags during the connection and teardown of a tcp connection. Following this we were given a script that checked what hosts had which ports open. We then had to modify the script
to add things like error and options checking. I will have a link to that file [here](https://github.com/gabequinto/SEC335/blob/main/portscanner.sh). Following this, we ran an Nmap scan against the ip address of 10.0.5.22. While running the scan we ran a wireshark capture to find open ports. After this we ran a scan against the same ip address as before except this time we also ran a port scan using -p against the port 3389. We did this scan once as sudo and one time not as sudo. We did this to find the difference between the two and from what I can see , running this command without sudo only tests to see if the host specified is down. When running this command with sudo it tests to see if the host is down as well as probing the port, checking if its open and what its service is. 

