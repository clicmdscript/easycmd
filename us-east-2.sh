#!/bin/bash

#import variable
region=us-east-2
amiubuntu=ami-020db2c14939a8efb
#instancesType=t2.micro
#instancesType=t2.small
instancesType=t2.medium

#get keyname
aws ec2 describe-key-pairs --key-name --region $region | jq . > keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' keyname.json)
#   $keyname

PROCESS="KeyName";

if cat keyname.json | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS Exits. Start create EC2" ;
		#nothing todo
else
        echo "$PROCESS not exits, create new keyname" ;
        aws ec2 --region $region create-key-pair --key-name $region --output text > /home/ubuntu/keypem/$region.pem
fi

echo "create keyname completed"
aws ec2 describe-key-pairs --key-name --region $region | jq . > keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' keyname.json)



#get security group id
aws ec2 describe-security-groups --region $region | jq . > securitygr.json
sed -r -n -e '/^[[:space:]]*"GroupId":/s/^[^:]*: *"(.*)", *$/\1/p' securitygr.json > temgroup.txt
groupsecid=$(head -1 temgroup.txt)
#   $groupsecid

#get subnet id
aws ec2 describe-subnets --region $region | jq . > SubnetId.json
sed -r -n -e '/^[[:space:]]*"SubnetId":/s/^[^:]*: *"(.*)", *$/\1/p' SubnetId.json > tempsubnet.txt
SubnetId=$(head -1 tempsubnet.txt)
#   $SubnetId

#create
aws ec2 run-instances --region $region --image-id $amiubuntu --count 1 --instance-type $instancesType --key-name $keyname --security-group-ids $groupsecid --subnet-id $SubnetId --output text



#finish

echo "Create done"
