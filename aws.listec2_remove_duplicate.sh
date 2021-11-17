#!/bin/bash

#import list region
source includes/_list_region.sh

rm -rf ippool/needtodelete1.txt
rm -rf ippool/needtodelete2.txt
rm -rf ippool/tobedelete2.txt
rm -rf ippool/idel1.txt
rm -rf ippool/idel2.txt
rm -rf ippool/eu-*.txt
rm -rf ippool/ap-*.txt
rm -rf ippool/us-*.txt
rm -rf ippool/ca-*.txt
rm -rf ippool/needtodelete.txt

set +m
for region in $(aws ec2 describe-regions --query "Regions[*].[RegionName]" --output text); do 
  aws ec2 describe-instances --region "$region" | jq ".Reservations[].Instances[] | {type: .InstanceType, state: .State.Name, zone: .Placement.AvailabilityZone}" &
done; wait; 
set -m

aws ec2 describe-instances --region $region1 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region1.txt
sleep 1
aws ec2 describe-instances --region $region2 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region2.txt
sleep 1
aws ec2 describe-instances --region $region3 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region3.txt
sleep 1
aws ec2 describe-instances --region $region4 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region4.txt
sleep 1
aws ec2 describe-instances --region $region5 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region5.txt
sleep 1
aws ec2 describe-instances --region $region6 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region6.txt
sleep 1
aws ec2 describe-instances --region $region7 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region7.txt
sleep 1
aws ec2 describe-instances --region $region8 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region8.txt
sleep 1
aws ec2 describe-instances --region $region9 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region9.txt
sleep 1
aws ec2 describe-instances --region $region10 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region10.txt
sleep 1
aws ec2 describe-instances --region $region11 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region11.txt
sleep 1
aws ec2 describe-instances --region $region12 --query "Reservations[].Instances[][PublicIpAddress]" | grep -o -P '\d+\.\d+\.\d+\.\d+' | grep -v '^10\.' >> ippool/$region12.txt

find ippool/ -type f -size 0 -delete
zoneavai=$(ls ippool/)
echo "$zoneavai" > zoneip.txt

