#!/bin/bash

target=$(cat ricorda.txt)

echo -e "\e[01;32mDomain IP lookup\e[00m"
echo " "
links2 -dump http://www.ip-tracker.org/locator/ip-lookup.php?ip=$target > domin.txt
echo " "
cat domin.txt | grep --color -oP 'IP Address:.*$'
echo " "
cat domin.txt | grep --color -oP 'Country:.*$'
echo " "
cat domin.txt | grep --color -oP 'City:.*$'
echo " "
cat domin.txt | grep --color -oP 'ISP:.*$'
echo " "
cat domin.txt | grep --color -oP 'Organization:.*$'
echo " "
rm domin.txt

echo -e "Informations from whois \e[00;33mdatabase search\e[00m"
sleep 3

whois $target > whois.txt
echo " "
echo -e "\e[00;38mCountry: \e[00m"
cat whois.txt | grep -E "Country: +"
echo " "
echo -e "\e[00;33mCity: \e[00m"
cat whois.txt | grep -Eio "Admin City: [a-zA-Z0-9]+"
cat whois.txt | grep -Eio "Registrant City: [a-zA-Z0-9]+"
cat whois.txt | grep -Eio "Tech City: [a-zA-Z0-9]+"
cat whois.txt | grep -E "Street: +"
echo " "
echo -e "\e[00;35mPhone: \e[00m"
echo " "
cat whois.txt | grep -E "Phone: +"
echo " "
echo -e "\e[00;32mWhois email: \e[00m"
cat whois.txt | grep -E "[a-zA-Z0-9]+@[a-zA-Z0-9]+.*"
echo " "
echo -e "Names: "
cat whois.txt | grep -E "Name: +"
echo " "
rm whois.txt

echo " "
sleep 0.5
echo -e "\e[01;33mDiscover technologies used in the website\e[00m"
echo -e "\e[00;31mBETA! \e[00;33mnow using allora record search\e[00m"
sleep 1.5
echo " "

links2 -dump https://allora.io/profile/$target > agr.txt

cat -n agr.txt | sed -n '/stack/,/Contact/p' > agr2.txt
echo -e "\e[01;32mTECHNOLOGIES USED: \e[00m"
cat agr2.txt | grep "*"
echo " "
