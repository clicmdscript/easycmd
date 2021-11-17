#!/bin/bash
 
rm -rf ippool/
rm -rf keypem/
rm -rf log/
rm -rf *.sh
rm -rf cronjobgen*
rm -rf *.json
rm -rf mail/
rm -rf temgroup.txt
rm -rf tempsubnet.txt

git clone https://github.com/clicmdscript/easycmd.git
mv easycmd/* /home/ubuntu/
rm -rf easycmd/

chmod +x mail/*.sh
chmod +x mail/smtp-cli
chmod +x *.sh
chmod +x includes/*.sh
mkdir log/
echo "NEW install" > log/log_addcron.txt
./add_cronjob.sh


./_install_awscli.sh


rm -rf aws.list-ec2inzone-ip.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/_remove_duplicate_mainregion.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/aws.listec2_remove_duplicate.sh

wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/add_cronjob.sh
./add_cronjob.sh
chmod +x *.sh

./_remove_duplicate_mainregion.sh
