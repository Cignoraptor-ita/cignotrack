#!/bin/bash

target=$(cat ricorda.txt)

echo " "
echo -e "\e[01;33mSearch and EXTRACTION OF\e[00m PDF,XLS files from website and linked pages..."
sleep 2

echo " "

mkdir -p document-analysis

echo -e "\e[00;34mSearch documents in the index\e[00m: "
wget --user-agent="Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/27.0" --no-check-certificate -e robots=off \
-H -nd -nc -np \
--recursive -p \
--level=1 \
--accept pdf,xls,txt \
--convert-links -N \
--limit-rate=250k \
--wait 2.0 \
-P document-analysis $target

cd document-analysis

echo " "
echo -e "\e[00;33mArtist...\e[00m"
exiftool * | grep --color -E Artist
echo "============================="
echo -e "\e[00;33mSoftware...\e[00m"
exiftool * | grep --color -E Software
echo "============================= "
echo -e "\e[00;33mMake...\e[00m"
exiftool * | grep --color -E Make
echo "============================= "
echo -e "\e[00;33mAuthor...\e[00m"
exiftool * | grep --color -E Author
echo "============================="
echo -e "\e[00;33mCreator...\e[00m"
exiftool * | grep --color -E Creator
echo "============================="
echo -e "\e[00;33mProducer...\e[00m"
exiftool * | grep --color -E Producer
echo " "
cd - >> /dev/null
echo " "
echo -e "\e[00;34mSearch for documents in linked pages\e[00m: "
sleep 1.5

wget --no-check-certificate -qO- $target > fs.html
cat fs.html | egrep -o "(http|https):.*\">" | awk 'BEGIN {FS="\""};{print $1}' > sm.txt
cat sm.txt | grep "$target" > smt.txt
cat smt.txt | grep -e ".pdf" > trovati.txt
cat smt.txt | grep -e ".xls" >> trovati.txt

rm sm.txt
rm smt.txt

for line in `cat trovati.txt`; do

wget --user-agent="Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/27.0" --no-check-certificate -e robots=off \
-H -nd -nc -np \
--recursive -p \
--level=1 \
--accept pdf,xls \
--convert-links -N \
--limit-rate=250k \
--wait 2.0 \
-P document-analysis $line

cd document-analysis

echo " "
echo -e "\e[01;32m$line\e[00m"
echo " "
echo -e "\e[00;33mArtist...\e[00m"
exiftool * | grep --color -E Artist
echo "============================="
echo -e "\e[00;33mSoftware...\e[00m"
exiftool * | grep --color -E Software
echo "============================= "
echo -e "\e[00;33mMake...\e[00m"
exiftool * | grep --color -E Make
echo "============================= "
echo -e "\e[00;33mAuthor...\e[00m"
exiftool * | grep --color -E Author
echo "============================="
echo -e "\e[00;33mCreator...\e[00m"
exiftool * | grep --color -E Creator
echo "============================="
echo -e "\e[00;33mProducer...\e[00m"
exiftool * | grep --color -E Producer
echo " "
done

cd - >> /dev/null
rm trovati.txt
rm -R document-analysis


echo " "
echo -e "\e[00;38m===========\e[00m"
echo " "
echo -e "\e[00;33mDo you want search for documents using Bing too?"
echo -e "\e[01;33mNot use it if you're testing in LAN (local)\e[00m"
echo -e "\e[00m---- \e[00;34m y \e[00m|\e[00;34m n \e[00m" 
read scelu


if [[ $scelu = y ]]
then

mkdir -p pdf-analysis

wget --no-check-certificate -e robots=off -H --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -r -l 1 -nd -A .pdf -P pdf-analysis https://www.bing.com/search?q=site%3A$target+filetype%3Apdf
sleep 0.5
cd pdf-analysis
echo " "
echo -e "\e[00;33mArtist...\e[00m"
exiftool * | grep --color -E Artist
echo "============================="
echo -e "\e[00;33mSoftware...\e[00m"
exiftool * | grep --color -E Software
echo "============================= "
echo -e "\e[00;33mMake...\e[00m"
exiftool * | grep --color -E Make
echo "============================= "
echo -e "\e[00;33mAuthor...\e[00m"
exiftool * | grep --color -E Author
echo "============================="
echo -e "\e[00;33mCreator...\e[00m"
exiftool * | grep --color -E Creator
echo "============================="
echo -e "\e[00;33mProducer...\e[00m"
exiftool * | grep --color -E Producer
echo " "

cd - >> /dev/null
sleep 0.2
rm -R pdf-analysis

echo " "

elif [[ $scelu = n ]]
then

echo " "
echo "Exit..."

else

echo " "
echo -e "\e[00;31mDo you need choose y or n ... exiting!\e[00m"
echo " "
fi
