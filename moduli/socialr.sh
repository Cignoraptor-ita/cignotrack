#!/bin/bash

echo -e "\e[00;31m--------------------------------------------------------------\e[00m"

PS3="Choose social:"

select opt in "FACEBOOK" "TWITTER" "BADOO" "LINKEDIN" "MYSPACE" "NETLOG" "INSTAGRAM" "ALL" "ERASE ALL DOCS"
do
    case "$opt" in
        'FACEBOOK')
echo "LINKS"

cat socialfb.txt | grep -E http
cat socialfb.txt | grep -E www.
       ;;
       'TWITTER')

echo "LINKS"

cat twi.txt | grep -E http
cat twi.txt | grep -E www.

      ;;
      'BADOO')
echo "LINKS"

cat badu.txt | grep -e "http"

      ;;
      'LINKEDIN')
echo "LINKS"

cat linke.txt | grep -E http
cat linke.txt | grep -E www.

      ;;
      'MYSPACE')
echo "LINKS"

cat mysp.txt | grep -E http
cat mysp.txt | grep -E www.
      ;;
      'NETLOG')
echo "LINKS"

cat netl.txt | grep -e http

      ;;
      'INSTAGRAM')
echo "LINKS"

cat insta.txt | grep -E http
cat insta.txt | grep -E www.
      ;;
      'ALL')
echo "LINKS"
echo " "
echo -e "\e[01;34mFACEBOOK\e[00m"
cat socialfb.txt | grep -E "http"
cat socialfb.txt | grep -E "www."
echo " "
echo -e "\e[00;33mTWITTER\e[00m"
cat twi.txt | grep -E "http"
cat twi.txt | grep -E "www."
echo " "
echo -e "\e[00;31mBADOO\e[00m"
cat badu.txt | grep -e "http"
echo " "
echo -e "\e[00;32mLINKEDIN\e[00m"
cat linke.txt | grep -E "http"
cat linke.txt | grep -E "www."
echo " "
echo -e "\e[00m;35mMYSPACE\e[00m"
cat mysp.txt | grep -E "http"
cat mysp.txt | grep -e "www."
echo " "
echo -e "\e[00;37mNETLOG\e[00m"
cat netl.txt | grep -e "http"
echo " "
echo -e "\e[01;39mINSTAGRAM\e[00m"
cat insta.txt | grep -E http
cat insta.txt | grep -E www.
echo " "

rm insta.txt
rm netl.txt
rm mysp.txt
rm linke.txt
rm badu.txt
rm twi.txt
rm socialfb.txt
      ;;
      'ERASE ALL DOCS')
rm insta.txt
rm netl.txt
rm mysp.txt
rm linke.txt
rm badu.txt
rm twi.txt
rm socialfb.txt
echo -e "ALL DOCS \e[00;31mERASED!\e[00m"
      break;
 esac
done

echo "FINE"
exit
echo " " 



