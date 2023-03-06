#!/bin/bash

#The TOol is created by DeeCodes07
#Contact: https://t.me/DeeCodes_07

clear

cowsay -f ghostbusters "This tool is create by DeeCodes"
#This command use for URL.
read -p "Please enter Your Target URL: " URL
read -p "Please enter your name:" name

waybackurls "$URL" | tee way-target.txt
katana -u "$URL" | tee kat-target.txt

clear

#Create a directory for all parameters
cd
mkdir parameters
cd parameters
mkdir waybackurls
mkdir katana
cd

#Searching Parameters
figlet Searched Parameters

cat way-target.txt | grep '?next=\|?url=\|?target=\|?rurl=\|?dest=\|?destination=\|?redir=\|?redirect_uri=\|?redirect_url=\|?redirect=\|/redirect/\|/cgi-bin/redirect.cgi?\|/out/\|/out?\|?view=\|/login?to=\|?image_url=\|?go=\|?return=\|?returnTo=\|?return_to=\|?checkout_url=\|?continue=\|?return_path=' | tee redirect-parameter.txt
cat way-target.txt | grep '?cat=\|?dir=\|?action=\|?board=\|?date\|?detail=\|?file=\|?download=\|?path=\|?folder=\|?prefix=\|?include=\|?page=\|?inc=\|?locate=\|?show=\|?doc=\|?site=\|?type=\|?view=\|?content=\|?document=\|?layout=\|?mod=\|?conf=' |tee LFI-parameters.txt
cat way-target.txt | grep '?dest=\|?redirect=\|?uri=\|?path=\|?continue=\|?url=\|?window=\|?next=\|?data=\|?reference=\|?site=\|?html=\|?val=\|?validate=\|?domain=\|?callback=\|?return=\|?page=\|?feed=\|?host=\|?port=\|?to=\|?out=\|?view=\|?dir=' | tee ssrf-parameters.txt
cat way-target.txt | grep '?id=\|?page=\|?dir=\|?search=\|?category=\|?class=\|?file=\|?url=\|?news=\|?item=\|?menu=\|?lang=\|?name=\|?ref=\|?title=\|?view=\|?topic=\|?thread=\|?type=\|?date=\|?form=\|?join=\|?main=\|?nav=\|?region=' | tee sql-parameters.txt
cat way-target.txt | grep '?q=\|?s=\|?search=\|?id=\|?lang=\|?keyword=\|?query=\|?page=\|?keywords=\|?year=\|?view=\|?email=\|?type=\|?name=\|?p=\|?month=\|?immagine=\|?list_type=\|?url=\|?terms=\|?categoryid=\|?key=\|l=\|?begindate=\|?enddate=' | tee xss-parameters.txt
cat way-target.txt | grep '?cmd=\|?exec=\|?command=\|?execute=\|?ping=\|?query=\|?jump=\|?code=\|?do=\|?reg=\|?func=\|?arg=\|?option=\|?load=\|?process=\|?step=\|?read=\|?function=\|?req=\|?feature=\|?exe=\|?module=\|?payload=\|?run=\|?print=' | tee RCE-parameters.txt
cat way-target.txt | grep '/js/config.js\|/js/credentials.js\|/js/secrets.js\|/js/keys.js\|/js/password.js\|/js/api_keys.js\|/js/auth_token.js\|/js/access_token.js\|/js/sessions.js\|/js/authorization.js\|/js/encryption.js\|/js/certification.js\|/js/ssl_keys.js\|/js/passphrases.js\|/js/policies.js\|/js/permissions.js\|/js/privileges.js\|/js/hashes.js\|/js/salts.js\|/js/nonces.js\|/js/signatures.js\|/js/digests.js\|/js/tokens.js\|/js/cookies.js\|/js/tosecr3tdonotlook.js' | tee js-endpoints.txt
cat way-target.txt | grep 'wp-admin.php\|wp-config.php\|wp-content/uploads\|wp-load\|wp-signup.php\|wp-json\|wp-includes\|index.php\|wp-login.php\|wp-links-opml.php\|wp-activate.php\|wp-blog-header.php\|wp-cron.php\|wp-links.php\|wp-mail.php\|xmlrpc.php\|wp-settings.php\|wp-trackback.php\|admin-bar.php' | tee wp-endpoints.txt

#Create a txt file for a parameters
mv way-target.txt parameters/waybackurls/
mv redirect-parameter.txt parameters/waybackurls/
mv LFI-parameters.txt parameters/waybackurls
mv ssrf-parameters.txt parameters/waybackurls
mv sql-parameters.txt parameters/waybackurls
mv xss-parameters.txt parameters/waybackurls
mv RCE-parameters.txt parameters/waybackurls
mv js-endpoints.txt parameters/waybackurls
mv wp-endpoints.txt parameters/waybackurls

cat kat-target.txt | grep '?next=\|?url=\|?target=\|?rurl=\|?dest=\|?destination=\|?redir=\|?redirect_uri=\|?redirect_url=\|?redirect=\|/redirect/\|/cgi-bin/redirect.cgi?\|/out/\|/out?\|?view=\|/login?to=\|?image_url=\|?go=\|?return=\|?returnTo=\|?return_to=\|?checkout_url=\|?continue=\|?return_path=' | tee redirect-parameter.txt
cat kat-target.txt | grep '?cat=\|?dir=\|?action=\|?board=\|?date\|?detail=\|?file=\|?download=\|?path=\|?folder=\|?prefix=\|?include=\|?page=\|?inc=\|?locate=\|?show=\|?doc=\|?site=\|?type=\|?view=\|?content=\|?document=\|?layout=\|?mod=\|?conf=' |tee LFI-parameters.txt
cat kat-target.txt | grep '?dest=\|?redirect=\|?uri=\|?path=\|?continue=\|?url=\|?window=\|?next=\|?data=\|?reference=\|?site=\|?html=\|?val=\|?validate=\|?domain=\|?callback=\|?return=\|?page=\|?feed=\|?host=\|?port=\|?to=\|?out=\|?view=\|?dir=' | tee ssrf-parameters.txt
cat kat-target.txt | grep '?id=\|?page=\|?dir=\|?search=\|?category=\|?class=\|?file=\|?url=\|?news=\|?item=\|?menu=\|?lang=\|?name=\|?ref=\|?title=\|?view=\|?topic=\|?thread=\|?type=\|?date=\|?form=\|?join=\|?main=\|?nav=\|?region=' | tee sql-parameters.txt
cat kat-target.txt | grep '?q=\|?s=\|?search=\|?id=\|?lang=\|?keyword=\|?query=\|?page=\|?keywords=\|?year=\|?view=\|?email=\|?type=\|?name=\|?p=\|?month=\|?immagine=\|?list_type=\|?url=\|?terms=\|?categoryid=\|?key=\|l=\|?begindate=\|?enddate=' | tee xss-parameters.txt
cat kat-target.txt | grep '?cmd=\|?exec=\|?command=\|?execute=\|?ping=\|?query=\|?jump=\|?code=\|?do=\|?reg=\|?func=\|?arg=\|?option=\|?load=\|?process=\|?step=\|?read=\|?function=\|?req=\|?feature=\|?exe=\|?module=\|?payload=\|?run=\|?print=' | tee RCE-parameters.txt
cat kat-target.txt | grep '/js/config.js\|/js/credentials.js\|/js/secrets.js\|/js/keys.js\|/js/password.js\|/js/api_keys.js\|/js/auth_token.js\|/js/access_token.js\|/js/sessions.js\|/js/authorization.js\|/js/encryption.js\|/js/certification.js\|/js/ssl_keys.js\|/js/passphrases.js\|/js/policies.js\|/js/permissions.js\|/js/privileges.js\|/js/hashes.js\|/js/salts.js\|/js/nonces.js\|/js/signatures.js\|/js/digests.js\|/js/tokens.js\|/js/cookies.js\|/js/tosecr3tdonotlook.js' | tee js-endpoints.txt
cat kat-target.txt | grep 'wp-admin.php\|wp-config.php\|wp-content/uploads\|wp-load\|wp-signup.php\|wp-json\|wp-includes\|index.php\|wp-login.php\|wp-links-opml.php\|wp-activate.php\|wp-blog-header.php\|wp-cron.php\|wp-links.php\|wp-mail.php\|xmlrpc.php\|wp-settings.php\|wp-trackback.php\|admin-bar.php' | tee wp-endpoints.txt

#Create a txt file for a parameters
mv kat-target.txt parameters/katana
mv redirect-parameter.txt parameters/katana
mv LFI-parameters.txt parameters/katana
mv ssrf-parameters.txt parameters/katana
mv sql-parameters.txt parameters/katana
mv xss-parameters.txt parameters/katana
mv RCE-parameters.txt parameters/katana
mv js-endpoints.txt parameters/katana
mv wp-endpoints.txt parameters/katana

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

clear

#Turn into Motivate
cowsay -f daemon $name WAKEUP AND HUNT NOW
