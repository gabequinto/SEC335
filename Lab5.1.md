### Overview and Reflection
------
For this lab we were tasked with using various programs to guess and crack the passwords of four users on a local server. These four users each had a bio page on the local server and we 
used cewl to create a password list for each of these users. We then used rsmangler to create a mangled password list that we then used in hyrda to finally crack the passwords. This 
was a very fun lab and really opened my eyes to what can be done on a kali box. I found creating password lists based off of educated guessing very intersting because it shows 
how unprocteted people are. 

### CEWL
------
This was my first time using the program cewl and I must say it is a cool program. This program will crawl websites to generate a custom wordlist than can be used to guess passwords. To use this program you first have to define the depth of the website you want to crawl with the '-d' delimeter, you then must pass the URL of the website you want to crawl. Following this you just have to use the '-w' delimeter to write to a file. For the purpose of this lab, the command used was `cewl -d ` http://10.0.5.23/bios/frodo -w frodowordlist.txt`. One thing about this program is that you have to edit the wordlist that is output because this program will pick up words like 'the' and 'and', essentially words that will never be a password. 

### rsmangler
------
Like Cewl, this was my first time using rsmangler and again it is a very interesting program. This program will mangle words, for example replacing an 'i' with a '1' or adding '123' at the end. This program allows someone to pass in a wordlist of potential passwords and all of those words in the list will be mangled in an attempt to be able to properly guess a password. I will have a section below that goes over each  parameter that was used in the lab and what they do. For the purposes of this lab the command used was `rsmangler --file frodowordlist.txt -x 12 -m 9  -l -s -e -i -p -u  -a --output frodo.mangled.txt`

###### rsmangler parameters
-------
` -x: the maxium length of a mangled word`    
` -m: the minimum length of a mangled word `    
`-l: will add a lowercase version of each word`    
`-u: will add a uppercase version of each word`      
`-s: will swap the case of the word`      
`-e: will add ed to the end of the word`    
`-i: will add ing to the end of the word`    
`-p: will permutate all of the words`    
`-a: create an acronym based on all the words entered in order and add to word list ` 
`--output: will output list of mangled words to specified file`  

### Hydra
------
For this lab we had an option to use Hyrda, Medusa, or ncrack to actually crack the password. For this lab I chose to use Hyrda just because I was already somewhat familiar with it from a previous lab. I will only cover what we did with Hyrda in this lab instead of going over the basics of Hydra. That is already covered in a previous tech journal that I will link [here](https://github.com/gabequinto/SEC335/blob/main/Activity4.1.md#building-a-password-list-and-gaining-access). For the purposes of this lab we were first trying to get http authentication and then ssh authentication. On the target server there is a page '/secret' that we were tasked with gaining access to. The command used for http authentication was `Hdra -l frodo -P frodo.mangled.txt -s 80 -f 10.0.5.21 http-get /secret/`. 
