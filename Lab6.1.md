### Overview
------
In this lab we were tasked with gaining access to more accounts on the server bios.shire.local that we gained access to last week. We first had to start with gaining root access 
with one of the users from last week. The user who had root access was pipen and then once we had root access we had to cat /etc/passwd and /etc/shadow to get the users and hashed 
passwords and salt values from the users. We than used unshadow and John the Ripper as well as Hashcat to get the passwords of the users and gain access to their accounts. 

### Reflection
-----
This lab was very fun and was the first time that I used unshadow, John, and Hashcat. I had a few issues with unshadow and John but they were both just errors involved with getting used to the syntax and commands. Other than that this lab wasn't all to challenging and I was able to get it done somewhat quickly. I would say that password generators and managers are pretty important. These password generators ensure that your password won't be on a wordlist and that is something that is very important. 

### Format of /etc/shadow
------
Understanding the format of the /etc/shadow file was something that was very important in this lab. For this lab we only focused on the username, encryption method, salt value, and hashed password. The 

### John the Ripper
------
For this lab, one of the methods we used to crack the passwords was John the Ripper. This is an application that when passed a password list and an unshadowed file will crack the passwords of the given users as long as their passwords are in the passed password file. There will be a small section on the Unshadow utility below. The command that was used in class to crack passwords were `john --wordlist=passwdlist.txt unshadowed.txt`. This will take the list of potential passwords, 'passwdlist.txt', and run that against the unshadowed file in order to attempt to crack the passwords. 

#### Unshadow
------
The unshadow utility is used by John the Ripper in order to crack passwords. This utility takes the hashed passwords in the /etc/shadow file and combines those values with the /etc/passwd file in order to create a file that John the Ripper is able to use. 

### HashCat
------
The second application that we used to crack passwords in this lab was HashCat. It works roughly the same as John where you pass an unshadowed file as well as a potential word list. The command that was used in this lab to crack the passwords was `hashcat -m 1800 -a 0 -o cracked.txt unshadowed.txt passwdlist.txt`. In this command -m indicates the algorithm that was used to create the hash that we are cracking, -a indicates the attack mode value, and -o indicates the file that the cracked passwords are output to. The algorithm values are near impossible to memorize as there are so many of them so this page [here](https://manpages.org/hashcat) is a very useful tool. 
