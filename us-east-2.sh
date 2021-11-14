#!/bin/bash

#import variable
region=us-east-2
source includes/_ec2_type.sh
source includes/$region-ami.sh

#get keyname in temp/
aws ec2 describe-key-pairs --key-name --region $region | jq . > temp/keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' temp/keyname.json)
#   $keyname

PROCESS="KeyName";
if cat temp/keyname.json | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS Exits. Start create EC2" ;
		#nothing todo
else
        echo "$PROCESS not exits, create new keyname" ;
        aws ec2 --region $region create-key-pair --key-name $region --output text > keypem/$region.pem
fi
echo "Keyname completed"

aws ec2 describe-key-pairs --key-name --region $region | jq . > temp/keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' temp/keyname.json)

#get security group id
aws ec2 describe-security-groups --region $region | jq . > temp/securitygr.json
sed -r -n -e '/^[[:space:]]*"GroupId":/s/^[^:]*: *"(.*)", *$/\1/p' temp/securitygr.json > temp/temgroup.txt
groupsecid=$(head -1 temp/temgroup.txt)
#   $groupsecid

#get subnet id
aws ec2 describe-subnets --region $region | jq . > temp/SubnetId.json
sed -r -n -e '/^[[:space:]]*"SubnetId":/s/^[^:]*: *"(.*)", *$/\1/p' temp/SubnetId.json > temp/tempsubnet.txt
SubnetId=$(head -1 temp/tempsubnet.txt)
#   $SubnetId

#create
aws ec2 run-instances --region $region --image-id $amiubuntu --count 1 --instance-type $instancesType --key-name $keyname --security-group-ids $groupsecid --subnet-id $SubnetId --output text
#finish
echo "Create done"

