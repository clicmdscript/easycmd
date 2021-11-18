#!/bin/bash
cd /home/ubuntu
source includes/_list_region_for_random_check.sh
accaxxname=$(head -1 accountname.txt)

regionchecklimit=$(aws service-quotas get-service-quota --region $defregioned --service-code ec2 --quota-code L-1216C47A --query 'Quota.Value')

echo Acc Name: "$accaxxname"  @ region: "$defregioned" limit:= "$regionchecklimit"
