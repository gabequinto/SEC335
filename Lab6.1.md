### Overview
------
In this lab we were tasked with gaining access to more accounts on the server bios.shire.local that we gained access to last week. We first had to start with gaining root access 
with one of the users from last week. The user who had root access was pipen and then once we had root access we had to cat /etc/passwd and /etc/shadow to get the users and hashed 
passwords and salt values from the users. We than used unshadow and John the Ripper as well as Hashcat to get the passwords of the users and gain access to their accounts. 

### Reflection
-----
