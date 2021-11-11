#!/bin/bash

aws configure list | grep region | awk '{print $2}' > default.region.txt
defregioned=$(head -1 default.region.txt)

regionchecklimit=$(aws service-quotas get-service-quota --region $defregioned --service-code ec2 --quota-code L-1216C47A --query 'Quota.Value')
echo "$defregioned = $regionchecklimit"

