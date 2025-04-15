Parasite is a tool used to crawl the website url and  the injection parameters and also it will separate the 200 status code from website directories.
And the tool is very useful in Bug Hunting. 

* Finding hidden links
* Finding directories
* Finding Injection parameters (URL redirection, SSRF, LFI, XSS, RCE, SQL).

Step to Exploit :-

* Give permissions to two file "chmod 777 setup.sh && chmod 777 parasite.sh"
* First setup the file from "./setup.sh"
* After the setup enter this command "./parasite.sh" and hit enter.
* They will ask a website url. Enter the target url and hit enter.
* After all they will bruteforce the directories
* End of work. It will create a Folder ("parameters"). In the folder you can see the finded (directories, crawl, injections parameters).
