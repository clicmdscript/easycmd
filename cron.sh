#!/bin/bash
cd /home/ubuntu

./ec2delete.sh

echo "Delete all completed in all region"
echo "Start create new instance in random region"

datelog=$(date "+%Y.%m.%d-%H.%M")

COMMANDS=(
"./us-east-1.sh && echo > log/$datelog-us-east-1.txt"
"./us-east-2.sh && echo > log/$datelog-us-east-2.txt"
"./us-west-1.sh && echo > log/$datelog-us-west-1.txt"
"./us-west-2.sh && echo > log/$datelog-us-west-2.txt"
"./ap-northeast-2.sh && echo > log/$datelog-ap-northeast-2.txt"
"./ap-southeast-1.sh && echo > log/$datelog-ap-southeast-1.txt"
"./ap-southeast-2.sh && echo > log/$datelog-ap-southeast-2.txt"
"./ap-northeast-1.sh && echo > log/$datelog-ap-northeast-1.txt"
"./ca-central-1.sh && echo > log/$datelog-ca-central-1.txt"
"./eu-central-1.sh && echo > log/$datelog-eu-central-1.txt"
"./eu-west-1.sh && echo > log/$datelog-eu-west-1.txt"
"./eu-west-2.sh && echo > log/$datelog-eu-west-2.txt"

        )

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 1 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 2 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 3 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 4 ---############################"
