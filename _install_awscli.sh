#!/bin/bash

echo "Get AWS API access key"
#read -p "Enter AWS Access Key ID..........:: " AWS_CLI_KEY
#read -p "Enter AWS Secret Access Key......:: " AWS_CLI_SECRET
#read -p "Enter text with Name of default region like:: US-EAS***: \

# 1     N.Virginia  us-east-1
# 2     OHIO        us-east-2
# 3     N.Califonia us-west-1
# 4     Oregon      us-west-2
# 5     SEOUL       ap-northeast-2
# 6     SINGAPORE   ap-southeast-1
# 7     SYDNEY      ap-southeast-2
# 8     TOKYO       ap-northeast-1
# 9     CANADA      ca-central-1
# 10    FRANKFURT   eu-central-1
# 11    IRELAND     eu-west-1
# 12    LONDON      eu-west-2

#Select one region:: " AWS_DEFAULT_RGION
read -p "ENTER - ACCOUNT NAME OR NUMBER......:: " ACCNAMENUM

FILEACN=accountname.txt
if [ -f "$FILEACN" ]; then
    echo "$FILEACN exists."
else

echo "File not exits. create new one"
echo "$ACCNAMENUM" > accountname.txt
cp accountname.txt .aws/accountname.txt

fi

chmod +x mail/*.sh
chmod +x mail/smtp-cli
chmod +x *.sh
chmod +x includes/*.sh
mkdir log/
echo "NEW install" > log/log_addcron.txt
mkdir keypem/
mkdir ippool/
mkdir temp/
echo "Make Dir log, ippool and keypem complete"

echo "Set timezone"
#sudo timedatectl set-timezone Asia/Ho_Chi_Minh
echo "Set timezone done"

echo "Install Python 3.8"
#sudo apt update
#sudo apt install software-properties-common
#yes '' |sudo add-apt-repository ppa:deadsnakes/ppa
#sudo apt install -y python3.8

echo "Install Python Complete"
echo "-----------------------------------------------"
echo "Install AWS-CLI"
#sudo apt install -y unzip
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install
#rm -rf awscliv2.zip

echo "Install AWS-CLI COMPLETED"
echo "-----------------------------------------------"
echo "Install JQ addon"
#sudo apt install -y jq
echo "Install jq COMPLETED"
echo "-----------------------------------------------"
echo "Install plugin require for smtp-cli"
#sudo apt install -y libio-socket-ssl-perl  libdigest-hmac-perl  libterm-readkey-perl libmime-lite-perl libfile-libmagic-perl libio-socket-inet6-perl

echo "Seting AWS CLI KEY ACCESS"
echo "-----------------------------------------------"
#aws configure set aws_access_key_id $AWS_CLI_KEY
#aws configure set aws_secret_access_key $AWS_CLI_SECRET
#aws configure set default.region $AWS_DEFAULT_RGION
#Store data name of default region from prevent it from delete
#echo "$AWS_DEFAULT_RGION" > .aws/DefaultRegionName.txt

echo "Seting AWS CLI KEY ACCESS COMPLETED.............."
#echo "access key: $AWS_CLI_KEY"
#echo "secret key: $AWS_CLI_SECRET"
#echo "Default Region: $AWS_DEFAULT_RGION"
echo ""
echo "PLEASE DISABLE REGION OF THIS VPS TO PREVENT FROM DELETE"
echo "Add cron to system"
echo "Add crontab with add_cronjob.sh"
./add_cronjob.sh
echo "Run prevent-region.sh"
./region-auto-lock.sh
#./region-prevent.sh
echo "================ INSTALL COMPLETE================"
echo ""
