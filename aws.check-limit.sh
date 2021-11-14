#!/bin/bash
accaxxname=$(head -1 /home/ubuntu/accountname.txt)

DEFRGRAND=("us-east-1"
"us-east-2"
"us-west-1"
"us-west-2"
"ap-southeast-1")

defregioned=($(shuf -n1 -e "${DEFRGRAND[@]}"))

regionchecklimit=$(aws service-quotas get-service-quota --region $defregioned --service-code ec2 --quota-code L-1216C47A --query 'Quota.Value')

echo Acc Name: "$accaxxname"  @ region: "$defregioned" Current limit:= "$regionchecklimit"