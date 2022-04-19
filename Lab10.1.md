### Overview
------
For this lab we were taske with learing and using commands to find suid programs as well as world-writable files. This will be a short article about the commands that I used to find
these programs and files. 

##### Finding SUID programs
------
`find / -perm -u=s -type f 2>/dev/null`

##### Finding World-Writable Files
------
`find / -type f -perm /o=w 2>/dev/null`

For both of these commands if you know the directory that these files or programs are in enter that after 'find'.
