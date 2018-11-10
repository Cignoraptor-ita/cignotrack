#!/bin/bash

target=$( cat ricorda.txt)

echo " "
echo -e "\e[00;31mSENSITIVE FILES DISCOVERY MODULE \e[00m"
echo " "
sleep 0.6

echo -e "\e[00;33mSearching for interesting files: \e[00m"
echo " "
echo "http://$target:80/robots.txt" > intere.txt
echo "http://$target:80/sitemap.xml.gz" >> intere.txt
echo "http://$target:80/sitemap.xml" >> intere.txt
echo "http://$target/web-console/" >> intere.txt
echo "http://$target:80/admin-console/" >> intere.txt
echo "http://$target:80/jmx-console/" >> intere.txt
echo "http://$target:80/server-status" >> intere.txt
echo "http://$target:80/elmah.axd" >> intere.txt
echo "http://$target:80/test.php" >> intere.txt
echo "http://$target:80/phpinfo.php" >> intere.txt
echo "http://$target:80/crossdomain.xml" >> intere.txt

for line in `cat intere.txt`; do

echo -e "\e[01;32m$line\e[00m"
curl -o /dev/null --silent --head --write-out '%{http_code}\n' -L $line > status.txt
status=$(cat status.txt)

if [[ $status = "200" ]]
then
echo -e "\e[01;33mFile exist!\e[00m"

elif [[ $status = "403" ]]
then
echo -e "\e[01;38mFile access is Forbidden\e[00m"

elif [[ $status = "301" ]]
then
echo -e "\e[01;38mFile is moved\e[00m"

elif [[ $status = "400" ]]
then
echo -e "Status 400 ---> \e[01;38mFile not found\e[00m"

else

echo -e "\e[01;39mFile not exist or there is a problem to access it\e[00m"
fi


sleep 1
done

echo " "
sleep 0.3
echo -e "\e[00;31mSearch for header response "
sleep 0.5

curl -L -I --silent --max-time 8 "https://$target/" | grep "@"

echo " "
sleep 0.3
echo -e "\e[00;31mSearch log-database files...\e[00m"
sleep 2

sleep 0.5
links2 -http.fake-user-agent "Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36" -ssl.certificates 0 -dump https://www.google.de/search?q=$target+filetype%3Alog+filetype%3Adat > datelog.txt
sleep 2
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump https://www.google.es/search?q=site:$target+intitle:"index+of" > ind.txt
sleep 0.2
cat datelog.txt ind.txt > datlog.txt
sleep 0.2
cat datlog.txt | grep --color -e "http://"
cat datlog.txt | grep --color -e "www."
sleep 0.5
rm datlog.txt
echo " "
echo -e "\e[01;33mSearch Whatsapp images/backup leaks correlated with the target\e[00m"
sleep 3
links2 -http.fake-user-agent "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6P Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36" -ssl.certificates 0 -dump https://www.google.es/search?q="Whatsapp Databases"+$target+intitle:"index+of" > whats.txt
sleep 0.2
cat whats.txt | grep --color -e "http://"
cat whats.txt | grep --color -e "www."
rm whats.txt

echo " "

echo -e "\e[01;33mSearch for Whatsapp chat invite (useful for social engineering and information gathering)\e[00m"
echo -e "\e[00;31mBeta status!\e[00m"
sleep 2
echo " "

links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump https://www.google.nl/search?q=intext:"https://chat.whatsapp.com/invite/"+intitle:"$target" > chatse.txt

echo -e "\e[00;34mPages with invite to chat: \e[00m"
cat chatse.txt | grep --color -e "http://"
cat chatse.txt | grep --color -e "www."
echo " "
rm chatse.txt
echo -e "\e[01:42m                    \e[00m"
echo " "
echo "Ok... hoping google it's not blocking... now will start a dps (default password search)"
echo "\e[00;41                        \e[00m"
echo " "
sleep 2

links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump google.it/search?q=site:"$target"+"default password"+AND+"password"+"secret key"+AND+"password" > dfp.txt

cat dfp.txt | grep --color -e http
cat dfp.txt | grep --color -e www.
rm dfp.txt && rm intere.txt



echo -e "\e[00;32m ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\e[00m"
echo -e "\e[01;33mAll done\e[00m"
echo -e "\e[00;33m------------------END-------------------\e[00m"
echo " "
