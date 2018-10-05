#!/bin/bash

target=$(cat ricorda.txt)

userc=$(cat clean.txt)


echo " "
echo -e "\e[01;34mSOCIAL MEDIA TRACKING MODULE \e[00;33mstarting...\e[00m"
sleep 0.5
echo -e "\e[01;34mSOCIAL MEDIA LINKS SEARCH\e[00m"
sleep 1.4

echo " "


echo "Searching social links in the Website"
wget --no-check-certificate -qO- $target > fs.html
cat fs.html | egrep -o "(http|https):.*\">" | awk 'BEGIN {FS="\""};{print $1}' > sm.txt
sleep 0.3
echo " "
	echo "------------------------------------------"
echo " " 
sleep 1   		
echo -e "\e[00;41mSOCIAL NETWORK LINKS in the website: \e[00m"
echo " "
cat sm.txt | grep --color -E twitter
echo " "
cat sm.txt | grep --color -E plus.google.com
echo " "
cat sm.txt | grep --color -E facebook
echo " "
cat sm.txt | grep --color -E linkedin
echo " "
cat sm.txt | grep --color -E pinterest
echo " "
cat sm.txt | grep --color -E instagram
echo " "
cat sm.txt | grep --color -E youtube


echo " "
echo -e "\e[01;32mSearching \e[01;31mInstagram \e[01;32mpeople related\e[00m"
echo " "
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -dump https://web.stagram.com/search?query=$target > lak.txt
echo " "
cat lak.txt | grep --color -E "@"
echo " "
sleep 0.2
rm lak.txt

echo " "
echo -e "\e[01;32mSearching \e[01;34mGoogle plus \e[01;32m related links\e[00m"
echo " "

links2 -http.fake-user-agent "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -dump lakako.com/googleplus/search/"$target" > gpli.txt
echo " "
cat gpli.txt | grep -E https://
sleep 0.2
rm gpli.txt
echo " "
echo -e "\e[00;31mAsset may be broken\e[00m"
echo " "

echo " "
echo -e "\e[01;34mSearch associated twitter hastags\e[00m"
echo " "

links2 -dump https://twitter.com/search?q=$target > twih.txt
echo " "
grep -Eio "#[a-zA-Z0-9./:-]+" twih.txt > dhash.txt
cat dhash.txt
sleep 0.3
rm twih.txt && rm dhash.txt



echo " "

echo -e "\e[00;31m>>>>>>> \e[01;33mFACEBOOK SEARCH IS UNDER BETTER DEVELOPMENT\e[00m"
sleep 2

echo " "
echo -e "\e[01;34mSocial media tracking for domain like user... \e[00m"
echo " "

echo "https://twitter.com/$userc/" > listautenti.txt
echo "https://youtube.com/user/$userc/" >> listautenti.txt
echo "https://github.com/$userc/" >> listautenti.txt
echo "https://instagram.com/$userc/" >> listautenti.txt
echo "https://pinterest.com/$userc/" >> listautenti.txt
echo "https://vimeo.com/$userc/" >> listautenti.txt
echo "https://facebook.com/$userc" >> listautenti.txt
echo "https://$userc.tumblr.com" >> listautenti.txt

for line in `cat listautenti.txt`; do
echo -e "\e[01;32m$line\e[00m"
curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17" -o /dev/null --silent --head --write-out '%{http_code}\n' -L $line > status.txt

status=$(cat status.txt)

if [[ $status = "200" ]]
then
echo -e "\e[01;33mUser exist!\e[00m"

elif [[ $status = "403" ]]
then
echo -e "\e[01;38mAccess Forbidden\e[00m"

elif [[ $status = "301" ]]
then
echo -e "\e[01;38mFile is moved\e[00m"

elif [[ $status = "400" ]]
then
echo -e "Status 400 ---> \e[01;38mNot found or error\e[00m"

elif [[ $status = "405" ]]
then
echo -e "Status 405 ---> \e[01;38mFirewalled \e[00;31m :-( \e[00m"

else

echo -e "\e[01;39mUser not exist or there is a problem to access it\e[00m"

fi


echo " "
sleep 0.5
done


rm clean.txt && rm listautenti.txt


echo -e "Some Linkedin people links \e[00;31massociated\e[00m with organization target"
echo -e "\e[00;31mBETA \e[00m | \e[00;33mMay generate false positives\e[00m "
sleep 2

links2 -dump google.nl/search?q=site:linkedin.com+"$target" > la.txt

cat la.txt | grep --color "http://" > lah.txt
cat lah.txt | grep -Eio "https://[a-zA-Z0-9./:-]+"
rm lah.txt

sleep 0.3
rm fs.html && rm sm.txt
rm la.txt
echo " "
echo -e "\e[01;36mSome Facebook links associated \e[00;33m(using google hacks)\e[00m"
sleep 2
echo " "

links2 -dump google.es/search?q=site:facebook.com+AND+"$userc"+"$userc"+"$userc" > socialfb.txt

echo "LINKS"
echo " "
echo -e "\e[01;34mFACEBOOK\e[00m"
cat socialfb.txt | grep "https://" > fbhttps.txt
cat fbhttps.txt | grep -Eio "https://[a-zA-Z0-9./:-]+"
rm fbhttps.txt

echo " "
