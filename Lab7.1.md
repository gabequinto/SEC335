### Overview
------
In this lab we were again attempting to gain access to another server on the network. We would gain initial access to this system through a poorly configured FTP server 
and inside of this we found credentials which we were able to use to SSH into the target server. From here we used the credentials found we were able to log onto a mysql database
running on the server. Inside of this mysql we were able to find a hashed password in the user table. This was the password of a user with root privelages. In order to view this 
password in plain text we had to run this hash through hashcat, however we had to modifiy it as it didn't fit the format that hashcat uses. I will go into much more depth on each
of the processes of this lab below.

### Reflection
------
For this lab we were tasked with reflecting on mistakes made by this servers systems admin as well as where we looked at the hint videos for this lab.  Starting with the mistakes made, the main mistake is allow anonymous logon into the FTP server. This is the way we gained our foothold in the system as well as getting more credentials. If the systems admin had configured this FTP server to not allow anonymous logins than we would not have been able to attack this server in the first place. I did have to watch the first hint video just to get started as I didn't know that if an FTP was misconfigured you could login as an anonymous user. After this stage, I was able to do this lab completely with only the help of a little external research. 

### Gaining Initial Access
------
In order to gain initial access to this server we exploited the misconfigured FTP service which allowed for an anonymous user to logon. To do this is very simple, just run the command `ftp 10.0.5.25`, that IP address being the server we are attacking. Than when prompted for the username and password enter 'anonymous' for both. Once on the server I ran `ls` just to see what directories there are.  
![github lab 7 1 ls](https://user-images.githubusercontent.com/78443183/157286824-9e14d3fa-0173-4c67-85c8-a8ea3adc5a7b.PNG)

For the purposes of this lab, one file and one directory stood out. The file that stuck out is the 'LocalSettings.php'. This file held credintials for the mysql database on the server as well as the database name. The picture below shows that section of this file. 

![github lab 7 1 localsettings](https://user-images.githubusercontent.com/78443183/157288979-b6cf4153-d0be-4d46-96e5-69f74213d36f.PNG)

Following this file, we look at the 'upload' directory. We had permissions to upload files to that directory and with this knowledge we uploaded a php webshell in order to cat the 'etc/passwd' file on this server. The webshell we used was the 'simple-backdoor.php'. It is a good idea to rename this to something that would not bring suspiction to it. After you have renamed it log back onto the FTP server and navigate to the 'upload' directory. Once there run the command `put <webshell filename>` and that webshell will be uploaded to the server. Now that the webshell is uploaded we were able to cat '/etc/passwd' by navigating to the address   
`http://10.0.5.25/upload/<webshell filename?cmd=cat+/etc/passwd`. The following screenshot is the output of this command. 
![github lab 7 1 cat etc](https://user-images.githubusercontent.com/78443183/157292063-8275392e-a896-4d62-9122-42fa35ff1b46.PNG)
You will notice the last user 'peregrin.took'. This is the user that we will use to SSH into the server. To SSH using this user, I used the password that was found in the 'LocalSettings.php' file and was able to get into the server. 

### Navigating MySQL Database
-------
On the target server a MySQL database was running and this held valuable information that we would use to gain root access. 