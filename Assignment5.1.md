This was a small assingment that showed us how to gain access to a debain machine if you have physical access to the PC. The exploit used is called the single user mode hack and it 
was a fairly simple process to gain access. First powercycle the machine and when it is rebooting press the space bar. You will then be presented with a screen that has the options 
"Kali GNU/Linux" and "Advanced option for Kali GNU/Linux". You want to select the first option by using the arrow keys to navigate to it and then pressing "e" to select it. Next find 
the line starting with "linux" and ending in the word "splash". Once there append "single init=/bin/bash" to the end of that line. Once finished press "ctrl+x". You will then be presented
with a command line. Enter the command `mount -rw -o remount /` to mount as read and write allowing changes to be made to the password. Next type in the command `passwd` and you 
will be prompted to enter a new password. Once complete you have set a new root password. Following this you can run the commands `sync` and `umount /` and then power cycle the machine 
to return to the normal gui. 
