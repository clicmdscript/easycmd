
 
rm -rf ippool/ keypem/ log/ mail/ includes/ temp/
rm -rf *.sh cronjobgen* *.json temgroup.txt tempsubnet.txt

git clone https://github.com/clicmdscript/easycmd.git
mv easycmd/* /home/ubuntu/
rm -rf easycmd/
chmod +x *.sh mail/*.sh mail/smtp-cli includes/*.sh
mkdir ippool/ keypem/ log/ temp/

echo "NEW install" > log/log_addcron.txt
echo > temp/tmphex.txt
./region-auto-lock.sh
./add_cronjob.sh
./cron.sh


