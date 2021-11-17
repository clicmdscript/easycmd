#!/bin/bash
 
rm -rf ippool/
rm -rf keypem/
rm -rf log/
rm -rf *.sh
rm -rf cronjobgen*
rm -rf *.json
rm -rf smtp-cli
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

./_install_awscli.sh

