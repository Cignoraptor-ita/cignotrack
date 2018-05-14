#!/bin/bash

target=$(cat ricorda.txt)

echo " "

echo -e "\e[01;33mSearch and EXTRACTION OF\e[00m images in the website..."
sleep 2

echo " "
sleep 1

mkdir -p images-analysis

wget --user-agent="Mozilla/5.0 (X11; FreeBSD amd64; rv:26.0) Gecko/20100101 Firefox/26.0" --no-check-certificate -e robots=off \
-H -nd -nc -np \
--recursive -p \
--level=1 \
--accept jpg,jpeg,png,gif \
--convert-links -N \
--limit-rate=250k \
--wait 2.0 \
-P images-analysis $target


#Extract Metadata con Exiftool

cd images-analysis
echo " "
echo -e "\e[00;31mMETADATA EXTRACTION\e[00m..."
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
echo -e "\e[00;33mCamera model...\e[00m"
exiftool * | grep --color -E "Camera Model Name"
echo "============================="
echo -e "\e[00;33mSerial number...\e[00m"
exiftool * | grep --color -E "Serial Number"
echo "============================="
echo -e "============\e[01;33mGPS LATITUDE\e[00m================="
exiftool * | grep --color -E "GPS Latitude"
echo " "
echo "============================="
 echo -e "============\e[01;33mGPS LONGITUDE\e[00m================="
exiftool * | grep --color -E "GPS Longitude"
echo " "
sleep 0.4
rm -R images-analysis
sleep 0.3
cd - >> /dev/null
