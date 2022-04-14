### Target IP Address 
-------
I was able to find the IP address using a reverse-dns lookup using NMap. The command used was `sudo nmap -sL 10.0.5.0/24 --dns-servers 10.0.5.22` as seen in the screenshot below. 

![target ip address](https://user-images.githubusercontent.com/78443183/163453104-a407a61a-df45-450b-9352-6f76f01488de.PNG)

### Open Ports
-------
I found the open ports as well as services running and their versions using the command `sudo nmap --top-ports 100 -A 10.0.5.31` as seen in the screenshot below. 
![open ports](https://user-images.githubusercontent.com/78443183/163453120-ba8882a4-932b-4170-b428-2251a052a5ad.PNG)

### Discovered Vulnerablilties / Achieving a Foothold
------
I found the vulnerability when looking at the website that was running on the server. When you navigate to the IP address you are met with a login screen. I was able to login when I entered `a' OR '1'='1` into the login box as seen below.  


### Root Comprimise
-------
With a little research, I was able to find that there was an admin page to this website at the address `https://10.0.5.31/entrance_exam/admin/`. I was able to login by entering `admin' OR '1'='1` as a username and '123' as a password. One thing to note is that the password you enter can be anything. 

##### Finding the Administrator Password
Follwing this I found through research that there was a way to use sqli to expose the has of the root password. To do this I entered ` https://10.0.5.31/entrance_exam/admin/view_enrollee.php?id=1'+UNION+SELECT+1,2,3,4,5,6,password,username,9,10,11,12,13,14,15+FROM+admin_list;` as seen in the screenshot below. 

With this hash, I used the online hash cracker 'CrackStation' to find the root password as seen below. 


### SSH into Gloin
------
Now all that is left is to SSH into the system and cat the root and user flag. The reason that I am making this section is because of one small detail that is needed to ssh into the system. That is, this is a windows box meaning that the username to ssh into is 'Administrator' instead of 'root' as you would on linux boxes. 

##### Cat of Root Flag

##### Cat of User Flag

### Sys-admin Vulnerability Mitigations
------
The main steps that a sysadmin could take to mitigate this from happening is to block sql injection. If sqli was not allowed than we would not have been able to log into the website as a regular user, admin user, or display the hash of the admin password. Some methods that could be used are input validation in which a sysadmin would whitelist input's so only certain inputs are allowed or parametrized queries which pre-compile statements and the user just has to enter the parameters in order for the statements to be finished. These are just two options but there are many more that will help mitigate against sqli attacks.

### Reflection
------
This lab was a very fun lab but very challenging as well. This was the first lab in which we were not given any hints or help and had to figure it out on our own. I was doing well in this lab up until I had to find the administrator password. I was able to find the hash of the password but didn't realize that online hash crackers exist. Because of this I was just running in circles thinking that something in the sqli statement I was entering in the URL was wrong. After figuring out these exist, and honestly, I'm not sure how I didn't know the existed before this, I was able to find the admin password easily. It took me one or two attempts to ssh into the system to realize that because it was a windows machine, I had to log in as 'Administrator'. Overall, I really liked this lab and it felt like the first 'real world' lab that we have completed so far. 
