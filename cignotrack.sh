#Scritto da Cignoraptor

echo " "
bar ()
{
BAR='*0*1*0*1*0*1*0*1*0*1*0*1 \e[00;34m !'    
                         
for i in {0..59}; do
    echo -ne "\r${BAR:0:$i}" 
    sleep 0.05
done
}
bar
echo " "
echo " "
echo -e "\e[00;44m______________________\e[00mCIGNOTRACK\e[00;44m______________________\e[00m"
echo " "

echo -e "\e[01;34m--------------------------------------------------------------------------------\e[00m"
echo -e "OSINT tool for extract \e[00;31mInformations, metadata \e[00mand \e[01;34mSocial media\e[00m tracking\e[00m"
echo -e "\e[01;34m________________________________________________________________________________\e[00m"
echo " "
echo -e "CODENAME: \e[00;44mReal swan\e[00m -- \e[00;31m Coded for privacy testing - The author decline any responsability for 
any illegal use of this tool\e[00m"
echo " "
bar
echo -e "\e[01;34mcoded by Cignoraptor\e[00m"
echo " "
echo "TARGET DOMAIN ... Example: domain.org"
read target

echo -e "Reading whois \e[00;33mdatabase\e[00m"

whois $target > w.txt
cat w.txt | grep --color -E "Registrant Name"
echo " "
cat w.txt | grep --color -E City
echo " "
cat w.txt | grep --color -E Phone
echo " "
cat w.txt | grep --color -E Email
echo " "
sleep 0.3
cat w.txt | grep --color -E Name
echo " "
cat w.txt | grep --color -E Address
echo  " "
rm w.txt
sleep 1

echo " "
echo -e "\e[01;34mSOCIAL MEDIA LINKS\e[00m"
echo " "

echo "Searching social links in the Website"
	links2 -dump http://$target | sed 's/^ *[0-9]*\. [^h]*//'| grep '^http' | sort | uniq > sm.txt 
	echo "------------------------------------------"
echo " " 
sleep 2   		
echo -e "\e[00;41mSOCIAL NETWORK LINKS\e[00m..."
echo " "
cat sm.txt | grep --color -E twitter
echo " "
cat sm.txt | grep --color -E plus.google.com
echo " "
cat sm.txt | grep --color -E facebook
echo " "
cat sm.txt | grep --color -E linkedin
echo " "
cat sm.txt | grep --color -E pinterest
echo " "
cat sm.txt | grep --color -E instagram

rm sm.txt
echo " "
sleep 1
echo -e "--->\e[00;34m20 more used words in the home page\e[00m"
sleep 1
links2 -dump http://$target > toppar
echo " "

sed 's/\<e\>//g' toppar > toppar2 
sed 's/\<la\>//g' toppar2 > toppar3  
sed 's/\<in\>//g' toppar3 > toppar4  
sed 's/\<a\>//g' toppar4 > toppar5 
sed 's/\<o\>//g' toppar5 > toppar6  
sed 's/\<nel\>//g' toppar6 > toppar7
sed 's/\<un\>//g' toppar7 > toppar8  
sed 's/\<una\>//g' toppar8 > toppar9
sed 's/\<who\>//g' toppar9 > toppar10  
sed 's/\<per\>//g' toppar10 > toppar11
sed 's/\<ha\>//g' toppar11 > toppar12 
sed 's/\<il\>//g' toppar12 > toppar13
sed 's/\<del\>//g' toppar13 > toppar14  
sed 's/\<alla\>//g' toppar14 > toppar15
sed 's/\<ho\>//g' toppar15 > toppar16  
sed 's/\<è\>//g' toppar16 > toppar17
sed 's/\<Ha\>//g' toppar17 > toppar18
sed 's/\<della\>//g' toppar18 > toppar19  
sed 's/\<le\>//g' toppar19 > toppar20
sed 's/\<dei\>//g' toppar20 > toppar21
sed 's/\<dell\>//g' toppar21 > toppar22  
sed 's/\<likes\>//g' toppar22 > toppar23  
sed 's/\<replies\>//g' toppar23 > toppar24
sed 's/\<http\>//g' toppar24 > toppar25
sed 's/\<ly\>//g' toppar25 > toppar26 
sed 's/\<bit\>//g' toppar26 > toppar27
sed 's/\<0\>//g' toppar27 > toppar28 
sed 's/\<retweet\>//g' toppar28 > toppar29
sed 's/\<alle\>//g' toppar29 > toppar30
sed 's/\<where\>//g' toppar30 > toppar31
sed 's/\<piace\>//g' toppar31 > toppar32
sed 's/\<mi\>//g' toppar32 > toppar33
sed 's/\<commenta\>//g' toppar33 > toppar34
sed 's/\<immagine\>//g' toppar34 > toppar35 
sed 's/\<contenere\>//g' toppar35 > toppar36
sed 's/\<all\>//g' toppar36 > toppar37
sed 's/\<the\>//g' toppar37 > toppar38 
sed 's/\<is\>//g' toppar38 > toppar39
sed 's/\<www\>//g' toppar39 > toppar40
sed 's/\<com\>//g' toppar40 > toppar41 
sed 's/\<ed\>//g' toppar41 > toppar42
sed 's/\<da\>//g' toppar42 > toppar43
sed 's/\<htm\>//g' toppar43 > toppar44
sed 's/\<it\>//g' toppar44 > toppar45
sed 's/\<lang\>//g' toppar45 > toppar46
sed 's/\<the\>//g' toppar46 > toppar47
sed 's/\<and\>//g' toppar47 > toppar48
sed 's/\<the\>//g' toppar48 > toppar49
sed 's/\<to\>//g' toppar49 > toppar50 
sed 's/\<of\>//g' toppar50 > toppar51
sed 's/\<will\>//g' toppar51 > toppar52
sed 's/\<what\>//g' toppar52 > toppar53





rm toppar2
rm toppar3
rm toppar4
rm toppar5
rm toppar6
rm toppar7
rm toppar8
rm toppar9
rm toppar10
rm toppar11
rm toppar12
rm toppar13
rm toppar14
rm toppar15
rm toppar16
rm toppar17
rm toppar18
rm toppar19
rm toppar20
rm toppar21
rm toppar22
rm toppar23
rm toppar24
rm toppar25
rm toppar26
rm toppar27
rm toppar28
rm toppar29
rm toppar30
rm toppar31
rm toppar32
rm toppar33
rm toppar34
rm toppar35
rm toppar36
rm toppar37
rm toppar38
rm toppar39
rm toppar40
rm toppar41
rm toppar42
rm toppar43
rm toppar44
rm toppar45
rm toppar46
rm toppar47
rm toppar48
rm toppar49
rm toppar50
rm toppar51
rm toppar52



#echo "INSERISCI NUOVO NOME FILE..ELIMINA E,LA,IN,A,O,NEL ECC..."
#read nuov
sed 's/di//g' toppar53 > risu
rm toppar53
#echo "INSERISCI PAROLE DA CERCARE "
#read uno
#read due

echo " "
echo -e "\e[01;37m====================================\e[00m"

echo -e "\e[01;33mTOP 20 WORDS\e[00m"
    cat risu | tr -cs "[:alnum:]" "\n"| tr "[:lower:]" "[:upper:]" | awk '{h[$1]++}END{for (i in h){print h[i]" "i}}'|sort -nr | cat -n | head -n 20
echo " "
rm toppar
rm risu
echo " "

echo -e "\e[00;31mEMAIL SPIDER-SEARCH\e[00m..."
echo -e "\e[00;33mWarning\e[00m: May be a long process"
echo " "

links2 -dump http://$target | sed 's/^ *[0-9]*\. [^h]*//'| grep '^http' | sort | uniq > emeli.txt

for line in `cat emeli.txt`; do

links2 -dump $line | grep --color -e "@$target"
done
rm emeli.txt
echo " "
sleep 1
echo -e "\e[01;33mSearching\e[00m pdf files..."

sleep 1

mkdir -p analysis

wget -e robots=off -H --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0" -r -l 1 -nd -A pdf http://google.com/search?q=site:$target+filetype:pdf -P analysis

#Extact Metadata con Exiftool

cd analysis
echo " "
echo -e "\e[00;31mMETADATA EXTRACTION\e[00m..."
echo " "
exiftool * | grep --color -E Artist
echo "============================="
 exiftool * | grep --color -E Software
echo "============================= "
 exiftool * | grep --color -E Make
echo "============================= "
 exiftool * | grep --color -E Author
echo "============================="
 exiftool * | grep --color -E Software
echo "============================= "
 exiftool * | grep --color -E Make
echo "============================= "
 exiftool * | grep --color -E Author
echo "============================= "
 exiftool * | grep --color -E Creator

cd -
echo " "
echo -e "$target \e[00;31mSearching\e[00m in \e[00;34mFACEBOOK\e[00m"
sleep 2
echo " "
links2 -dump google.com/search?q=site:facebook.com+"$target" > sf.txt

cat sf.txt | grep --color -e http
rm sf.txt
sleep 1
echo " "
echo -e "Some Linkedin people links \e[00;31massociated\e[00m with organization target"
links2 -dump google.com/search?q=site:linkedin.com+"$target" > la.txt

cat la.txt | grep --color -e http
rm la.txt
echo " "
echo -e "\e[00;33mWeb screenshot\e[00m"
sleep 1
wkhtmltoimage http://www.google.com/search?site="&"tbm=isch"&"source=hp"&"biw=1918"&"bih=931"&"q=site:$target target.png
echo " "
echo "Screenshot saved like $target.png"
echo -e "\e[00;32m ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\e[00m"
echo -e "\e[01;33mAll done\e[00m"
echo -e "\e[00;33m------------------END-------------------\e[00m"










