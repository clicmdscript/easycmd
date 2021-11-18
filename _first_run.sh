
 
rm -rf ippool/
rm -rf keypem/
rm -rf log/
rm -rf *.sh
rm -rf cronjobgen*
rm -rf *.json
rm -rf mail/
rm -rf temgroup.txt
rm -rf tempsubnet.txt
rm -rf includes/
rm -rf temp/
git clone https://github.com/clicmdscript/easycmd.git
mv easycmd/* /home/ubuntu/
rm -rf easycmd/
chmod +x mail/*.sh
chmod +x mail/smtp-cli
chmod +x *.sh
chmod +x includes/*.sh
mkdir ippool/
mkdir keypem/
mkdir log/
mkdir temp/
echo "NEW install" > log/log_addcron.txt
echo > temp/tmphex.txt
./region-auto-lock.sh


./add_cronjob.sh


