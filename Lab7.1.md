### Overview
------
In this lab we were again attempting to gain access to another server on the network. We would gain initial access to this system through a poorly configured FTP server 
and inside of this we found credentials which we were able to use to SSH into the target server. From here we used the credentials found we were able to log onto a mysql database
running on the server. Inside of this mysql we were able to find a hashed password in the user table. This was the password of a user with root privelages. In order to view this 
password in plain text we had to run this hash through hashcat, however we had to modifiy it as it didn't fit the format that hashcat uses. I will go into much more depth on each
of the processes of this lab below.

### Reflection
------

### Gaining Initial Access
------
