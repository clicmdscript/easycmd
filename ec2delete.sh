#!/bin/bash

region1=us-east-1
region2=us-east-2
region3=us-west-1
region4=us-west-2
region5=ap-northeast-2
region6=ap-southeast-1
region7=ap-southeast-2
region8=ap-northeast-1
region9=ca-central-1
region10=eu-central-1
region11=eu-west-1
region12=eu-west-2

#delete ec2
### DELETE BEFORE CREATE
##Get instance current running on region
insid1=$(aws ec2 describe-instances --filters --region $region1 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region1 --instance-ids $insid1

insid2=$(aws ec2 describe-instances --filters --region $region2 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region2 --instance-ids $insid2

insid3=$(aws ec2 describe-instances --filters --region $region3 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region3 --instance-ids $insid3

insid4=$(aws ec2 describe-instances --filters --region $region4 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region4 --instance-ids $insid4

insid5=$(aws ec2 describe-instances --filters --region $region5 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region5 --instance-ids $insid5

insid6=$(aws ec2 describe-instances --filters --region $region6 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region6 --instance-ids $insid6

insid7=$(aws ec2 describe-instances --filters --region $region7 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region7 --instance-ids $insid7

insid8=$(aws ec2 describe-instances --filters --region $region8 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region8 --instance-ids $insid8

insid9=$(aws ec2 describe-instances --filters --region $region9 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region9 --instance-ids $insid9

insid10=$(aws ec2 describe-instances --filters --region $region10 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region10 --instance-ids $insid10

insid11=$(aws ec2 describe-instances --filters --region $region11 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region11 --instance-ids $insid11

insid12=$(aws ec2 describe-instances --filters --region $region12 Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].InstanceId" --output text)
aws ec2 terminate-instances --region $region12 --instance-ids $insid12

echo "done"




