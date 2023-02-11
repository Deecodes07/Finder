#!/bin/bash

#This command use for URL.
read -p "Please enter Your Target URL: " URL
waybackurls "$URL" | tee target.txt

clear

#Searching Parameters
figlet Searched Parameters

cat target.txt | grep '?next=\|?url=\|?target=\|?rurl=\|?dest=\|?destination=\|?redir=\|?redirect_uri=\|?redirect_url=\|?redirect=\|/redirect/\|/cgi-bin/redirect.cgi?\|/out/\|/out?\|?view=\|/login?to=\|?image_url=\|?go=\|?return=\|?returnTo=\|?return_to=\|?checkout_url=\|?continue=\|?return_path=' | tee redirect-parameter.txt
cat target.txt | grep '?cat=\|?dir=\|?action=\|?board=\|?date\|?detail=\|?file=\|?download=\|?path=\|?folder=\|?prefix=\|?include=\|?page=\|?inc=\|?locate=\|?show=\|?doc=\|?site=\|?type=\|?view=\|?content=\|?document=\|?layout=\|?mod=\|?conf=' |tee LFI-parameters.txt
cat target.txt | grep '?dest=\|?redirect=\|?uri=\|?path=\|?continue=\|?url=\|?window=\|?next=\|?data=\|?reference=\|?site=\|?html=\|?val=\|?validate=\|?domain=\|?callback=\|?return=\|?page=\|?feed=\|?host=\|?port=\|?to=\|?out=\|?view=\|?dir=' | tee ssrf-parameters.txt
cat target.txt | grep '?id=\|?page=\|?dir=\|?search=\|?category=\|?class=\|?file=\|?url=\|?news=\|?item=\|?menu=\|?lang=\|?name=\|?ref=\|?title=\|?view=\|?topic=\|?thread=\|?type=\|?date=\|?form=\|?join=\|?main=\|?nav=\|?region=' | tee sql-parameters.txt
cat target.txt | grep '?q=\|?s=\|?search=\|?id=\|?lang=\|?keyword=\|?query=\|?page=\|?keywords=\|?year=\|?view=\|?email=\|?type=\|?name=\|?p=\|?month=\|?immagine=\|?list_type=\|?url=\|?terms=\|?categoryid=\|?key=\|l=\|?begindate=\|?enddate=' | tee xss-parameters.txt
cat target.txt | grep '?cmd=\|?exec=\|?command=\|?execute=\|?ping=\|?query=\|?jump=\|?code=\|?do=\|?reg=\|?func=\|?arg=\|?option=\|?load=\|?process=\|?step=\|?read=\|?function=\|?req=\|?feature=\|?exe=\|?module=\|?payload=\|?run=\|?print=' | tee RCE-parameters.txt

#Create a directory for all parameters
mkdir parameters

#Create a txt file for a parameters
mv target.txt parameters/
mv redirect-parameter.txt parameters/
mv LFI-parameters.txt parameters/
mv ssrf-parameters.txt parameters/
mv sql-parameters.txt parameters/
mv xss-parameters.txt parameters/
mv RCE-parameters.txt parameters/

clear

figlet Finding Directory

echo "Do you want to use a default wordlist..?? (default:yes) (yes/no)"
read response
if [ "$response" == "yes" ]; then
gobuster dir -u "$URL" -w .wordlist.txt -q | tee ex.txt
elif [ "$response" == "no" ]; then
dirb "$URL" | tee dir2.txt
exit
fi

#seprate the status code 200
cat ex.txt | grep "200)\|301)" | tee dir1.txt

#Move the 200 status code file to parameters folder
mv dir1.txt parameters/

#Remove the ex.txt file
rm -rf ex.txt

#Turn into Motivate
figlet WAKEUP AND HUNT
