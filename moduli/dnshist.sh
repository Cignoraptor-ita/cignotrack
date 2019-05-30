#!/bin/bash

target=$(cat ricorda.txt)

echo " "
echo -e "\e[00;33mSTATUS: \e[00;31mBETA\e[00m"
echo " "
echo "If a DNS server is vulnerable to DNS cache snooping"
echo "this module can discover sites saved in the cache"
echo " "

pwd > po2.txt
po2=$(cat po2.txt)
rm po2.txt

echo "You can add some new sites to the list | default list is $po2/dnshist/dnames.txt"
echo " "

echo "1 = Help | 2 = start"
read decis

if [[ $decis = 1 ]]
then

echo " "

echo "If in the response you see [[ can't find site | no answer ]] the site is not recorded in the cache"
echo "Back to menu"
echo " "


elif [[ $decis = 2 ]]
then

clear

dig +short $target > di.txt
head -1 di.txt
head -1 di.txt > di2.txt
rm di.txt

dnstarget=$(cat di2.txt)
rm di2.txt

for line in `cat dnshist/dnames.txt`; do

echo $line
echo "------------------------------"
echo -e "\e[01;33mAnswer: \e[00m"
nslookup -norecurse $line $dnstarget | grep --color "answer"
echo "------------------------------"
done
echo "Back to menu"

else
echo "Choose 1 or 2, exiting..."
exit
fi

