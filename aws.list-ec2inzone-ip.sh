#!/bin/bash

#import list region
source /home/ubuntu/includes/_list_region.sh

set +m
for region in $(aws ec2 describe-regions --query "Regions[*].[RegionName]" --output text); do 
  aws ec2 describe-instances --region "$region" | jq ".Reservations[].Instances[] | {type: .InstanceType, state: .State.Name, zone: .Placement.AvailabilityZone}" &
done; wait; set -m

aws ec2 describe-instances --region $region1s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region1s.txt
sleep 1
aws ec2 describe-instances --region $region2s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region2s.txt
sleep 1
aws ec2 describe-instances --region $region3s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region3s.txt
sleep 1
aws ec2 describe-instances --region $region4s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region4s.txt
sleep 1
aws ec2 describe-instances --region $region5s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region5s.txt
sleep 1
aws ec2 describe-instances --region $region6s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region6s.txt
sleep 1
aws ec2 describe-instances --region $region7s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region7s.txt
sleep 1
aws ec2 describe-instances --region $region8s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region8s.txt
sleep 1
aws ec2 describe-instances --region $region9s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region9s.txt
sleep 1
aws ec2 describe-instances --region $region10s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region10s.txt
sleep 1
aws ec2 describe-instances --region $region11s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region11s.txt
sleep 1
aws ec2 describe-instances --region $region12s --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region12s.txt

find ippool/ -type f -size 0 -delete
zoneavai=$(ls ippool/)
echo "$zoneavai" > zoneip.txt
