### Reflection
-------
This lab was a fun lab in which we were dipping our toes into metasploit. This seems to be a very powerful tool with thousands of exploits that are ready to be used. We were 
asked to reflect on the relitive merits of using this tool rather than handcrafting an exploit. I think that while it would be great to be able to handcraft every exploit that 
I use, it would also take way more time than I have available and I honestly still have a lot to learn in terms of coding before I can to that. Eventually I would love to 
be able to handcraft every exploit but for now I will use metasploit. 

### Basic Guide to Use Metasploit
-------
Launch metasploit using the command

`sudo msfconsole`

Select an exploit using the command 

`use exploit/multi/http/phpmyadmin_lfi_rce`

Just a note, this is just an example exploit, to search for exploits use the command

`search EXPLOIT_TO_SEARCH_FOR`

To set and show options see the screenshot below:

![metasploit set and show optins](https://user-images.githubusercontent.com/78443183/165345545-8568ddbd-2ec0-4238-b17b-04806d094203.PNG)

To run the exploit and get a shell see the screenshot below:

![running metasploit](https://user-images.githubusercontent.com/78443183/165346833-1dc3bb08-f0d6-4a10-a798-f6b337e2132b.PNG)

You may notice the command `python -c 'import.pty; pty.spawn("/bin/bash")'`. This allows for a more interactive shell, however it may not always work depending
on the system you are attacking. 
