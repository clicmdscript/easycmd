#!/bin/bash
cd /home/ubuntu

./ec2delete.sh
rm -rf ippool/*.txt

echo "Delete EC2 in all region"
echo "Start create new instance in random region"

datelog=$(date "+%Y.%m.%d-%H.%M")

COMMANDS=("./us-east-1.sh && echo > log/$datelog-auto-us-east-1.txt"
"./us-east-2.sh && echo > log/$datelog-auto-us-east-2.txt"
"./us-west-1.sh && echo > log/$datelog-auto-us-west-1.txt"
"./us-west-2.sh && echo > log/$datelog-auto-us-west-2.txt"
"./ap-northeast-2.sh && echo > log/$datelog-auto-ap-northeast-2.txt"
"./ap-southeast-1.sh && echo > log/$datelog-auto-ap-southeast-1.txt"
"./ap-southeast-2.sh && echo > log/$datelog-auto-ap-southeast-2.txt"
"./ap-northeast-1.sh && echo > log/$datelog-auto-ap-northeast-1.txt"
"./ca-central-1.sh && echo > log/$datelog-auto-ca-central-1.txt"
"./eu-central-1.sh && echo > log/$datelog-auto-eu-central-1.txt"
"./eu-west-1.sh && echo > log/$datelog-auto-eu-west-1.txt"
"./eu-west-2.sh && echo > log/$datelog-auto-eu-west-2.txt")

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 1/4 ---############################"
sleep 3s

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 2/4 ---############################"
sleep 3s

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 3/4 ---############################"
sleep 3s

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 4/4 ---############################"
sleep 3s
echo "DKM XONG ROI"
