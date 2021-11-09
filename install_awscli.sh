#!/bin/bash

cd /home/ubuntu
#wget all file 
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ap-northeast-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ap-northeast-2.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ap-southeast-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ap-southeast-2.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ca-central-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/eu-central-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/eu-west-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/eu-west-2.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/us-east-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/us-east-2.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/us-west-1.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/us-west-2.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/add_cronjob.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/cron.sh
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/ec2delete.sh
#wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/install_awscli.sh

chmod +x *.sh
echo "Add cron to system"
./add_cronjob.sh

echo "Install Python 3.8"
sudo apt update
sudo apt install software-properties-common
yes '' |sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8
echo "Install AWS-CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip

echo "Install JQ addon"
sudo apt install -y jq

echo "Install Completed"

