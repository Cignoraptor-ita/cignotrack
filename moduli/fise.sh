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
curl -o /dev/null --silent --head --write-out '%{http_code}\n' -L $line
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
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump https://www.google.de/search?q=$target+filetype%3Alog+filetype%3Adat > datelog.txt
sleep 2
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump https://www.google.es/search?q=site=$target+intitle:"index+of" > ind.txt
sleep 0.2
cat datelog.txt ind.txt > datlog.txt
sleep 0.2
cat datlog.txt | grep --color -e "http://"
cat datlog.txt | grep --color -e "www."
sleep 0.2
rm datlog.txt
echo " "


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
