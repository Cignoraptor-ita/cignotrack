#!/bin/bash

target=$( cat ricorda.txt)


echo " "
echo -e "\e[00;31mSENSITIVE FILES DISCOVERY MODULE \e[00m"
echo " "
sleep 0.6




wget --no-check-certificate -qO- $target > fs.html

cat fs.html | egrep -o "(http|https):.*\">" | awk 'BEGIN {FS="\""};{print $1}' > sm.txt

cat sm.txt | grep "$target" > smt.txt

rm sm.txt


echo "========"
echo -e "\e[00;33mFiles .conf: \e[00m"
echo " "
cat smt.txt | grep -e ".conf"
echo "======="
echo " "
echo "========"
echo -e "\e[00;33mFiles .log: \e[00m"
echo " "
cat smt.txt | grep -e ".log"
echo "======="
echo -e "\e[00;34m---------------------------------\e[00m"
echo " "

echo -e "\e[01;33mSearching for meta tag | hidden fields | debug leaks in the whole domain: \e[00m" 
sleep 2

for line in `cat smt.txt`; do

wget --no-check-certificate -qO- $line > out

echo " "
echo "--- $line"
echo -e "\e[01;33mSearch for meta tag with some possible leaks\e[00m: "
echo "------ "
grep --color -e "<meta" -e "<META" out
echo "------ "
echo " "

sleep 1
echo -e "\e[01;33mSearch for hidden fields\e[00m: "
echo "------ "
grep --color '<input type="hidden"' out
echo "------ "
echo " "


echo -e "\e[01;33mSearching for default passwords and debug comments\e[00m: "
echo "------ "
sleep 0.5

grep --color -e "default password" -e "debug" out
grep --color -w -e "<!--" out
grep --color -w -e "temporary access" -e "temporary password" out
grep --color -w -e "accesso temporaneo" -e "password temporanea" out

grep --color -e "Default password" -e "Debug" out
grep --color -w -e "Temporary access" -e "Temporary password" out
grep --color -w -e "Accesso temporaneo" -e "Password temporanea" out
echo "------ "
echo " "

done

echo " "
echo "--- INDEX"
echo -e "\e[01;33mSearch for meta tag with some possible leaks\e[00m: "
echo "------ "
grep --color -e "<meta" -e "<META" fs.html
echo "------ "
echo " "

echo -e "\e[01;33mSearch for hidden fields\e[00m: "
echo "------ "
grep --color '<input type="hidden"' fs.html
echo "------ "
echo " "

echo -e "\e[01;33mSearching for default passwords and debug comments\e[00m: "
echo "------ "
grep --color -e "default password" -e "debug" fs.html
grep --color -w -e "temporary access" -e "temporary password" fs.html
grep --color -w -e "accesso temporaneo" -e "password temporanea" fs.html

grep --color -e "Default password" -e "Debug" fs.html
grep --color -w -e "<!--" fs.html
grep --color -w -e "Temporary access" -e "Temporary password" fs.html
grep --color -w -e "Accesso temporaneo" -e "Password temporanea" fs.html

rm smt.txt && rm fs.html && rm out

echo "--------------"
echo " "

echo -e "\e[00;33mSearching for interesting files: \e[00m"
echo " "
echo "http://$target/robots.txt" > intere.txt
echo "http://$target/sitemap.xml.gz" >> intere.txt
echo "http://$target/sitemap.xml" >> intere.txt
echo "http://$target/web-console/" >> intere.txt
echo "http://$target/admin-console/" >> intere.txt
echo "http://$target/jmx-console/" >> intere.txt
echo "http://$target/server-status" >> intere.txt
echo "http://$target/elmah.axd" >> intere.txt
echo "http://$target/test.php" >> intere.txt
echo "http://$target/phpinfo.php" >> intere.txt
echo "http://$target/crossdomain.xml" >> intere.txt
echo "http://$target/test.html" >> intere.txt
echo "http://$target/test" >> intere.txt
echo "http://$target/login" >> intere.txt
echo "http://$target/old.aspx" >> intere.txt
echo "http://$target/old" >> intere.txt
echo "http://$target/old.html" >> intere.txt
echo "http://$target/files" >> intere.txt
echo "http://$target/share" >> intere.txt
echo "http://$target/passwords" >> intere.txt
echo "http://$target/private" >> intere.txt
echo "http://$target/database" >> intere.txt
echo "http://$target/condiviso" >> intere.txt
echo "http://$target/details" >> intere.txt
echo "http://$target/indice" >> intere.txt
echo "http://$target/index-of" >> intere.txt
echo "http://$target/credentials" >> intere.txt
echo "http://$target/credenziali" >> intere.txt
echo "http://$target/riserved" >> intere.txt
echo "http://$target/riservato" >> intere.txt
echo "http://$target/confidential" >> intere.txt
echo "http://$target/confidenziale" >> intere.txt
echo "http://$target/log" >> intere.txt
echo "http://$target/logs" >> intere.txt
echo "http://$target/secret" >> intere.txt
echo "http://$target/images" >> intere.txt
echo "http://$target/vids" >> intere.txt
echo "http://$target/videos" >> intere.txt
echo "http://$target/pics" >> intere.txt
echo "http://$target/main" >> intere.txt
echo "http://$target/includes" >> intere.txt
echo "http://$target/default" >> intere.txt
echo "http://$target/index/" >> intere.txt
echo "http://$target/error" >> intere.txt
echo "http://$target/error.php" >> intere.txt
echo "http://$target/conf" >> intere.txt
echo "http://$target/_index.php" >> intere.txt
echo "http://$target/_index.html" >> intere.txt
echo "http://$target/_index" >> intere.txt
echo "http://$target/index.php-bak" >> intere.txt
echo "http://$target/info.php" >> intere.txt
echo "http://$target/phpsecinfo" >> intere.txt
echo "http://$target/php.ini" >> intere.txt
echo "http://$target/phpmyadmin" >> intere.txt
echo "http://$target/mysqladmin" >> intere.txt
echo "http://$target/dabadmin" >> intere.txt
echo "http://$target/logon.php" >> intere.txt
echo "http://$target/login-test.php" >> intere.txt
echo "http://$target/xmlrpc.php" >> intere.txt
echo "http://$target/myadmin" >> intere.txt
echo "http://$target/awstats" >> intere.txt
echo "http://$target/application" >> intere.txt
echo "http://$target/test2" >> intere.txt
echo "http://$target/test2.php" >> intere.txt
echo "http://$target/test.html" >> intere.txt
echo "http://$target/test2.php-bak" >> intere.txt
echo "http://$target/_test" >> intere.txt
echo "http://$target/_test2" >> intere.txt




for line in `cat intere.txt`; do

#echo -e "\e[01;32m$line\e[00m"
curl -o /dev/null --silent --head --write-out '%{http_code}\n' -L $line > status.txt
status=$(cat status.txt)

if [[ $status = "200" ]]
then
echo -e "\e[01;33mFile exist!-----> $line\e[00m"
elif [[ $status = "404" ]]
then
:
else
:
#echo -e "\e[01;39mFile not exist or there is a problem to access it\e[00m"
fi


sleep 0.2
done


echo "-------------"
echo " "
sleep 0.3
echo -e "\e[00;31mSearch for @ header response "
sleep 0.5

curl -L -I --silent --max-time 7 "http://$target/" | grep "@"

echo " "
sleep 0.2
echo "----------"
echo " "
echo -e "\e[01;33mStarting google hacks/dorks, google can block you...\e[00m"
echo "Press ENTER for start: "
read pres4
echo " "

echo -e "\e[00;47mSTAGE 1:\e[00m "
echo "database-log | Whatsapp Databases | Whatsapp invite (useful for social engineering)"

firefox https://www.google.de/search?q="$target"+filetype%3Alog+filetype%3Adat https://www.google.nl/search?q="Whatsapp Databases"+"$target"+intitle:"index+of" https://www.google.it/search?q=$target+intext:"https://chat.whatsapp.com/invite/" &

sleep 2

echo " "
echo -e "\e[00;43STAGE 2:\e[00m "
echo "Default password and key | curriculum vitae and intranet search for human resources (useful for social engineering)"
echo "Press ENTER for start: "
read en4
sleep 0.5

firefox google.de/search?q=site:"$target"+"default password"+AND+"password"+"secret key"+AND+"password" https://www.google.nl/search?q=site:doc.google.com+intitle:"curriculum+vitae" https://google.it/search?q=$target+"human resources"+AND+$target+OR+"personale"+intitle:intranet &
echo " "

rm intere.txt



echo -e "\e[00;32m ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\e[00m"
echo -e "\e[01;33mAll done\e[00m"
echo -e "\e[00;33m------------------END-------------------\e[00m"
echo " "
