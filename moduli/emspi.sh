#!/bin/bash

target=$(cat ricorda.txt)
echo " "

echo -e "\e[00;31mEMAIL SEARCH\e[00m..."

echo " "

links2 -ssl.certificates 0 -dump http://$target > et.txt
sleep 0.5
echo -e "\e[01;33m$target emails from website\e[00m..."
grep --color -Eio "[a-zA-Z0-9]+@[a-z0-9]+.[a-z]+" et.txt

rm et.txt
echo " "
echo -e "\e[00;33mSTARTING EMAIL SPIDER\e[00m..."
echo -e "\e[00;33mWarning\e[00m: The spider search may be a long process!"
sleep 1.5

echo " "

wget --no-check-certificate -qO- $target > fs.html
cat fs.html | egrep -o "(http|https):.*\">" | awk 'BEGIN {FS="\""};{print $1}' > sm.txt
cat sm.txt | grep "$target" > smt.txt
rm sm.txt

for line in `cat smt.txt`; do

links2 -ssl.certificates 0 -dump $line | grep --color -Eio "[a-zA-Z0-9]+@[a-z0-9]+.[a-z]+"
done
sleep 0.2

echo " "
echo -e "\e[00;34mSearching Gmail.com | Yahoo.com | Libero.it emails associated...\e[00m"
sleep 0.5



#---
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump startpage.com/do/dsearch?query=$target+"@gmail.com" > gm.txt
sleep 0.3
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:27.0) Gecko/20100101 Firefox/27.0" -ssl.certificates 0 -dump startpage.com/do/dsearch?query=host%3A$target+"@yahoo.com" > yh.txt
sleep 0.5
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:30.0) Gecko/20100101 Firefox/30.0" -ssl.certificates 0 -dump startpage.com/do/dsearch?query=$target+"@libero.it" > li.txt
#---

links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump google.it/search?q=$target+"@gmail.com" >> gm.txt
sleep 1

links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/27.0" -ssl.certificates 0 -dump google.de/search?q=$target+"@yahoo.com" >> yh.txt

sleep 1

links2 -http.fake-user-agent "Mozilla/5.0 (Windows NT 6.4; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36." -ssl.certificates 0 -dump google.nl/search?q=$target+"@libero.it" >> li.txt


echo "======"
echo "GMAIL"
echo -e "\e[00;34m------\e[00m"
cat gm.txt | grep --color -Eio "[a-zA-Z0-9.]+@[a-z0-9]+.[a-z]+"
echo -e "\e[01;34m------\e[00m"
echo "======"

echo " "
sleep 0.4
echo "====="
echo "YAHOO"
echo -e "\e[01;34m------\e[00m"
cat yh.txt | grep --color -Eio "[a-zA-Z0-9.]+@[a-z0-9]+.[a-z]+"
sleep 0.2

echo -e "\e[01;34m------\e[00m"
echo "====="

echo " "
echo "========="
echo "LIBERO.IT"
echo -e "\e[00;34m---------\e[00m"
cat li.txt | grep --color -Eio "[a-zA-Z0-9.]+@[a-z0-9]+.[a-z]+"
echo -e "\e[00;34m---------\e[00m"
echo "========="
echo " "
rm fs.html && rm smt.txt && rm li.txt
rm yh.txt && rm gm.txt
