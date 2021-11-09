#!/bin/bash
cd /home/ubuntu

./ec2delete.sh

echo "Delete all completed in all region"
echo "Start create new instance in random region"


COMMANDS=(
"./us-east-1.sh"
"./us-east-2.sh"
"./us-west-1.sh"
"./us-west-2.sh"
"./ap-northeast-2.sh"
"./ap-southeast-1.sh"
"./ap-southeast-2.sh"
"./ap-northeast-1.sh"
"./ca-central-1.sh"
"./eu-central-1.sh"
"./eu-west-1.sh"
"./eu-west-2.sh"    
        )

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 1 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 2 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 3 ---############################"

$(shuf -n1 -e "${COMMANDS[@]}")
echo "############################--- DONE 4 ---############################"