#!/bin/bash
cd /home/ubuntu
# List of region
# 1 N.Virginia
region1=us-east-1
# 2 OHIO
region2=us-east-2
# 3 N Califonia 
region3=us-west-1
# 4 Oregon
region4=us-west-2
# 5 SEOUL
region5=ap-northeast-2
# 6 SINGAPORE
region6=ap-southeast-1
# 7 SYDNEY
region7=ap-southeast-2
# 8 TOKYO
region8=ap-northeast-1
# 9 CANADA
region9=ca-central-1
# 10    FRANKFURT
region10=eu-central-1
# 11    IRELAND
region11=eu-west-1
# 12    LONDON
region12=eu-west-2

#import list region
#source includes/_list_region.sh
echo " Run function delete all ec2, exlcude zone store ec2 running aws-cli. Remove ip list"
sh /home/ubuntu/ec2delete.sh
cd /home/ubuntu
echo "Delete done"
rm -rf /home/ubuntu/ippool/*.txt
echo "Delete ippool/txt done"
echo "Delete EC2 in all region"
echo "-----------------------------------------------------------------------"
echo "Start create new instance in random region"
datelog=$(date "+%Y.%m.%d-%H.%M")
COMMANDS=(
"./$region1.sh > log/$datelog-auto-$region1.txt"
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
"./$region12.sh > log/$datelog-$region12.txt"
)

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
echo "Sending mail......"
cd /home/ubuntu/mail/ && ./spmail.sh
cd ..
echo "DONE...................................................................."
