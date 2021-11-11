#!/bin/bash

set +m
for region in $(aws ec2 describe-regions --query "Regions[*].[RegionName]" --output text); do 
  aws ec2 describe-instances --region "$region" | jq ".Reservations[].Instances[] | {type: .InstanceType, state: .State.Name, zone: .Placement.AvailabilityZone}" &
done; wait; set -m

# 1 N.Virginia
region1s=us-east-1
# 2 OHIO
region2s=us-east-2
# 3 N Califonia 
region3s=us-west-1
# 4 Oregon
region4s=us-west-2
# 5 SEOUL
region5s=ap-northeast-2
# 6 SINGAPORE
region6s=ap-southeast-1
# 7 SYDNEY
region7s=ap-southeast-2
# 8 TOKYO
region8s=ap-northeast-1
# 9 CANADA
region9s=ca-central-1
# 10    FRANKFURT
region10s=eu-central-1
# 11    IRELAND
region11s=eu-west-1
# 12    LONDON
region12s=eu-west-2

aws ec2 describe-instances --region $region1s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region1s.txt
aws ec2 describe-instances --region $region2s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region2s.txt
aws ec2 describe-instances --region $region3s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region3s.txt
aws ec2 describe-instances --region $region4s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region4s.txt
aws ec2 describe-instances --region $region5s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region5s.txt
aws ec2 describe-instances --region $region6s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region6s.txt
aws ec2 describe-instances --region $region7s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region7s.txt
aws ec2 describe-instances --region $region8s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region8s.txt
aws ec2 describe-instances --region $region9s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region9s.txt
aws ec2 describe-instances --region $region10s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region10s.txt
aws ec2 describe-instances --region $region11s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region11s.txt
aws ec2 describe-instances --region $region12s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region12s.txt

find ippool/ -type f -size 0 -delete
zoneavai=$(ls ippool/)
echo $zoneavai


