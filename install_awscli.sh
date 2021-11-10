#!/bin/bash

echo "Get AWS API access key"
read -p "Enter AWS Access Key ID..........:: " AWS_CLI_KEY
read -p "Enter AWS Secret Access Key......:: " AWS_CLI_SECRET
read -p "Enter default region: us-east-1,us-east-2,us-west-1, us-west-2......:: " AWS_DEFAULT_RGION

cd /home/ubuntu
mkdir log/
mkdir keypem/
echo "Make Dir log and keypem complete"

echo "Set timezone"
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
echo "Set timezone done"

###wget all file

    #cd /home/ubuntu
    #git clone https://github.com/clicmdscript/easycmd.git
    #cd easycmd/
    #mv -r *.sh /home/ubuntu
    #cd ..
    #rm -rf easycmd/
    chmod +x *.sh

echo "Add cron to system"
./add_cronjob.sh

echo "Install Python 3.8"
sudo apt update
sudo apt install software-properties-common
yes '' |sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y python3.8

echo "Install Python Complete"
echo "-----------------------------------------------"
echo "Install AWS-CLI"
sudo apt install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip

echo "Install AWS-CLI COMPLETED"
echo "-----------------------------------------------"
echo "Install JQ addon"
sudo apt install -y jq
echo "Install jq COMPLETED"
echo "-----------------------------------------------"

echo "Seting AWS CLI KEY ACCESS"
echo "-----------------------------------------------"
aws configure set aws_access_key_id $AWS_CLI_KEY
aws configure set aws_secret_access_key $AWS_CLI_SECRET
aws configure set default.region $AWS_DEFAULT_RGION
echo "Seting AWS CLI KEY ACCESS COMPLETED.............."

echo "access key: $AWS_CLI_KEY"
echo "secret key: $AWS_CLI_SECRET"
echo "Default Region: $AWS_DEFAULT_RGION"
echo ""
echo "================ INSTALL COMPLETE================"
echo ""
echo ""
echo "need reboot system"
echo ""

