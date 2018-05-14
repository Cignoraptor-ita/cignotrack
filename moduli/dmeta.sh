#!/bin/bash

target=$(cat ricorda.txt)

echo " "
echo -e "\e[01;33mSearch and EXTRACTION OF\e[00m PDF files from Bing results..."
sleep 2

echo " "


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
