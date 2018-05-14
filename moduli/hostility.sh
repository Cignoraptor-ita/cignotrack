#!/bin/bash

target=$(cat ricorda.txt)
userc=$(cat clean.txt)

echo -e "\e[01;33mRapid hostility analysis against the target: \e[00m"
echo -e "(\e[00;33mJust Italian and English phrases\e[00m)"
sleep 2

links2 -dump https://twitter.com/search?l=it"&"q=$userc+odio+OR+schifo+OR+vaffanculo+OR+vergogna > hos1.txt
sleep 0.7
links2 -dump https://twitter.com/search?l=en"&"q=$userc+hate+OR+shit+OR+shame+OR+fuck >> hos1.txt
sleep 0.3
links2 -dump https://twitter.com/search?l=it"&"q=$target+odio+OR+schifo+OR+OR+vaffanculo+OR+vergogna >> hos1.txt
sleep 0.4
links2 -dump https://twitter.com/search?l=en"&"q=$target+hate+OR+shit+OR+shame+OR+fuck >> hos1.txt

cat hos1.txt | grep -e "schifo" -e "vergogna" -e "vaffanculo" -e "odio" > triste1
cat hos1.txt | grep -e "hate" -e "shame" -e "fuck" -e "shit" > triste2

cat triste1 triste2 > triste

echo " "
echo -e "\e[00;31m============\e[00m"
echo -e "\e[01;33mNegative phrases against $userc and $target (\e[00;31mVery rapid analysis)\e[00m"
echo -e "\e[00;33m"
cat triste | wc -l 
echo -e "\e[00m"
sleep 1
echo "$userc"
echo " "

rm hos1.txt && rm triste1 && rm triste2
rm triste
echo " "
