### Useful Nmap Flags and Commands
------
For this section I will be laying out any flags or commands that we have learned in class or that will be useful. This will be a list that keeps expanding throughout the class. 
-p : used for scanning a specific or range of ports.      
-Pn: Disables host discovery, only port scan
-sV: Detects the version of the service running on the specified port. (This will not always work)  
-A : This flag will enable OS detection, script scanning, version dection, and traceroute.   
-Pn: This will only scan for ports on the specified ip address.     
-O : Os detection using TCP/IP fingerprint scanning  
-sC: Scan with default NSE scripts  
--top-ports: specifies number of top ports to scan  
--dns-servers: specifies servers to use for reverse dns resolution   
