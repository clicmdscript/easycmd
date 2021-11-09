#!/bin/bash

echo "Get AWS API access key"
read -p "Enter AWS Access Key ID..........:: " AWS_CLI_KEY
read -p "Enter AWS Secret Access Key......:: " AWS_CLI_SECRET
read -p "Enter default region: us-east-1,us-east-2,us-west-1, us-west-2......:: " AWS_DEFAULT_RGION

cd /home/ubuntu
mkdir log/
mkdir keypem/

echo "Set timezone"
sudo timedatectl set-timezone Asia/Ho_Chi_Minh


rm -rf ap-northeast-1.sh
rm -rf ap-northeast-2.sh
rm -rf ap-southeast-1.sh
rm -rf ap-southeast-2.sh
rm -rf ca-central-1.sh
rm -rf eu-central-1.sh
rm -rf eu-west-1.sh
rm -rf eu-west-2.sh
rm -rf us-east-1.sh
rm -rf us-east-2.sh
rm -rf us-west-1.sh
rm -rf us-west-2.sh
rm -rf cron.sh
rm -rf ec2delete.sh
rm -rf view-ec2.sh
rm -rf add_cronjob.sh
rm -rf *.pem
rm -rf *.json
rm -rf *.txt

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
wget https://raw.githubusercontent.com/clicmdscript/easycmd/main/view-ec2.sh
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


aws configure set aws_access_key_id $AWS_CLI_KEY
aws configure set aws_secret_access_key $AWS_CLI_SECRET
aws configure set default.region $AWS_DEFAULT_RGION

echo "access key: $AWS_CLI_KEY"
echo "secret key: $AWS_CLI_SECRET"
echo "Default Region: $AWS_DEFAULT_RGION"
echo ""
echo "================ INSTALL COMPLETE==================="
echo ""
echo ""
echo "need reboot system"

