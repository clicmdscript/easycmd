#!/bin/bash

#import list region
source includes/_list_region.sh
echo " Run function delete all ec2, exlcude zone store ec2 running aws-cli. Remove ip list"
./ec2delete.sh
echo "Delete done"
rm -rf ippool/*.txt
echo "Delete ippool/txt done"
echo "Delete EC2 in all region"
echo "-----------------------------------------------------------------------"
echo "Start create new instance in random region"
datelog=$(date "+%Y.%m.%d-%H.%M")
COMMANDS=("./$region1.sh > log/$datelog-auto-$region1.txt"
"./$region2.sh > log/$datelog-auto-$region2.txt"
"./$region3.sh > log/$datelog-auto-$region3.txt"
"./$region4.sh > log/$datelog-auto-$region4.txt"
"./$region5.sh > log/$datelog-auto-$region5.txt"
"./$region6.sh > log/$datelog-auto-$region6.txt"
"./$region7.sh > log/$datelog-auto-$region7.txt"
"./$region8.sh > log/$datelog-auto-$region8.txt"
"./$region9.sh > log/$datelog-auto-$region9.txt"
"./$region10.sh > log/$datelog-$region10.txt"
"./$region11.sh > log/$datelog-$region11.txt"
"./$region12.sh > log/$datelog-$region12.txt")

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 1/4 ---############################"
sleep 1s
$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 2/4 ---############################"
sleep 1s
$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 3/4 ---############################"
sleep 1s
$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 4/4 ---############################"
sleep 1s
echo "Sending mail"
cd mail/
./spmail.sh
cd ..
echo "DONE...................................................................."
