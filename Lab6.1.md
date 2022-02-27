### Overview
------
In this lab we were tasked with gaining access to more accounts on the server bios.shire.local that we gained access to last week. We first had to start with gaining root access 
with one of the users from last week. The user who had root access was pipen and then once we had root access we had to cat /etc/passwd and /etc/shadow to get the users and hashed 
passwords and salt values from the users. We than used unshadow and John the Ripper as well as Hashcat to get the passwords of the users and gain access to their accounts. 

### Reflection
-----
This lab was very fun and was the first time that I used unshadow, John, and Hashcat. I had a few issues with unshadow and John but they were both just errors involved with getting used to the syntax and commands. Other than that this lab wasn't all to challenging and I was able to get it done somewhat quickly. I would say that password generators and managers are pretty important. These password generators ensure that your password won't be on a wordlist and that is something that is very important. 
