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
echo -e "\e[01;32mSearching \e[01;31mInstagram \e[01;32mhashtags related\e[00m"
echo " "
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -dump lakako.com/searchtag/"$target" > lak.txt
echo " "
cat lak.txt | grep --color -E "#"
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

echo "\e[00;31m>>>>>>> \e[01;33mFACEBOOK SEARCH IS UNDER BETTER DEVELOPMENT\e[00m"
sleep 2

echo " "
echo -e "\e[01;34mSocial media tracking for domain like user... \e[00m"
echo " "

echo "https:twitter.com/$userc/" > listautenti.txt
echo "https://youtube.com/user/$userc/" >> listautenti.txt
echo "https://github.com/$userc/" >> listautenti.txt
echo "https://instagram.com/$userc/" >> listautenti.txt
echo "https://pinterest.com/$userc/" >> listautenti.txt
echo "https://vimeo.com/$userc/" >> listautenti.txt
echo "https://$userc.tumblr.com" >> listautenti.txt

for line in `cat listautenti.txt`; do
echo -e "\e[01;32m$line\e[00m"
curl -o /dev/null --silent --head --write-out '%{http_code}\n' -L $line
sleep 1
done

rm clean.txt && rm listautenti.txt


echo -e "Some Linkedin people links \e[00;31massociated\e[00m with organization target"
echo -e "\e[00;31mBETA \e[00m | \e[00;33mMay generate false positives\e[00m "
sleep 2

links2 -dump google.nl/search?q=site:linkedin.com+"$target" > la.txt

cat la.txt | grep --color -e http
cat la.txt | grep --color -e "www."
sleep 0.3
rm fs.html && rm sm.txt
rm la.txt
echo " "
