# Gabe Quinto SEC335 Tech Journal
### 1/17/2022 - Week 1
------
* Assignment 1.2 - Installtion of Chrome Remote Desktop for Kali VM.
* [Activity 1.2 - Passive Recon Group Assignment](https://github.com/gabequinto/SEC335/blob/f3ee367a7778133d879d70829208ed048a33f386/Activity1.2.md) 

### 1/24/2022 - Week 2
------
* [Activity 2.1 Host Discover](https://github.com/gabequinto/SEC335/blob/main/Activity2.1.md)
* [Lab 2.1 Port Scanning 1](https://github.com/gabequinto/SEC335/blob/main/Lab2.1.md)
* [Lab 2.2 Port Scanning 2](https://github.com/gabequinto/SEC335/edit/main/Lab2.2.md)

###### Week 2 notes
------
This week we were working a lot with Nmap and wireshark to view how ports behave when probed with different methods. Some takeways were that I didn't realize when you turn on network discover and file and printer sharing on a windows box that new 3 ports would be open. As well, nmap -A is a command that is very important to remember as it runs OS detection, version detection, script scanning, and traceroute. At first I didn't realize that -A did all of that for you, so I ran an nmap command that had all four switches for those tasks. As well, every time we have a lab that uses Nmap, it just reminds me more and more to always run it as sudo to get the most information. 

###  1/31/2022 - Week 3
------
* [Activity 3.1 DNS Enumeration](https://github.com/gabequinto/SEC335/blob/main/Activity3.1.md)

###### Week 3 notes
------
This week we worked with DNS Enumeration and I learned a lot of useful commands and techniques. First I never knew that you can grep for an IP address with the command `grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'` and could theoretically grep for any combination of numbers with a variation of that command. As well I was unaware of the command `nmap -sL *network* --dns-servers *dnsserver*`. This is very useful for finding DNS servers and you are able to find the hostname along with the IP address. 
