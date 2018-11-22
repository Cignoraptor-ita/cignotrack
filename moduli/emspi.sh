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
sleep 0.4

echo " "
echo -e "\e[00;34mSearching Gmail emails associated using google dorks\e[00m"
sleep 2
links2 -http.fake-user-agent "Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" -ssl.certificates 0 -dump google.it/search?q=site:$target+AND+"%40gmail.com" | grep --color -Eio "[a-zA-Z0-9]+@gmail.com"
rm fs.html && rm smt.txt
