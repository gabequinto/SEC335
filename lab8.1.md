### Overview
------
This lab was a relitively short one where we were exploring what traditional webshell traffic looks like using WireShark and then comparing that to what the traffic looks like 
using the tool Weevley. 

### Reflection
------
This lab was very interesting as it showed that using Wireshark I was able to see all of the traffic in clear text when using a traditional webshell. As I am writing this
it makes complete sense as to why you are able to view webshell traffic in plaintext, but at the time it was very surprising. This lab really shows the benefit of a tool like
Weevely that will create a secure backdoor and encrypt the traffic so that you cannot view it as plaintext in something like Wireshark. I will have screenshot below comparing
the traffic between a traditional webshell and a Weevely session. 

### Weevely 
-------
To use this tool, I ran the command `weevely http://10.0.5.25/upload/gbackdoor.php 123`. In this command the IP address is the server that is getting targeted, and the 
directory being specifed is the directory where the webshell is located. The '123' at the end of the command is just the password that this session is being opened with.
Once you are connected weevely behaves like any webshell, the difference is that the traffic will be encrypted as seen in the screenshots below, the top one is the traditional 
webshell and the one below is the webshell through the weevely session. 
