#!/bin/bash

quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "=========SELECT REGION OF THIS VPS TO PREVENT NOT DELETE EC2 IN THIS REGION========="
echo "01. US EAST 1         N.Virginia"
echo "===================================================================================="
echo "02. US EAST 2         OHIO"
echo "===================================================================================="
echo "03. US WEST 1         N Califonia"
echo "===================================================================================="
echo "04. US WEST 2         OREGON"
echo "===================================================================================="
echo "05. ap-northeast-2    SEOUL"
echo "===================================================================================="
echo "06. ap-southeast-1    SINGAPORE"
echo "===================================================================================="
echo "07. ap-southeast-2    SYDNEY"
echo "===================================================================================="
echo "08. ap-northeast-1    TOKYO"
echo "===================================================================================="
echo "09. ca-central-1      CANADA"
echo "===================================================================================="
echo "10. eu-central-1      FRANKFURT"
echo "===================================================================================="
echo "11. eu-west-1         IRELAND"
echo "===================================================================================="
echo "12. eu-west-2         LONDON"
echo "===================================================================================="

echo "Q.Quit"

echo "Enter choice"

read choice

case $choice in

1)  echo "DISABLE 1"
    sed -i 's/insid1=$(aws/#insid1=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region1/#aws ec2 terminate-instances --region $region1/g' ec2delete.sh
    completeprevent=N.Virginia
	read junk;;
2)  echo "DISABLE 2"
    sed -i 's/insid2=$(aws/#insid2=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region2/#aws ec2 terminate-instances --region $region2/g' ec2delete.sh
    completeprevent==OHIO
	read junk;;
3)  echo "DISABLE 3"
    sed -i 's/insid3=$(aws/#insid3=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region3/#aws ec2 terminate-instances --region $region3/g' ec2delete.sh
    completeprevent=N Califonia
	read junk;;
4)  echo "DISABLE 4"
    sed -i 's/insid4=$(aws/#insid4=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region4/#aws ec2 terminate-instances --region $region4/g' ec2delete.sh
    completeprevent=OREGON
	read junk;;
5)  echo "DISABLE 5"
    sed -i 's/insid5=$(aws/#insid5=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region5/#aws ec2 terminate-instances --region $region5/g' ec2delete.sh
    completeprevent=SEOUL
	read junk;;
6)  echo "DISABLE 6"
    sed -i 's/insid6=$(aws/#insid6=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region6/#aws ec2 terminate-instances --region $region6/g' ec2delete.sh
    completeprevent=SINGAPORE
	read junk;;
7)  echo "DISABLE 7"
    sed -i 's/insid7=$(aws/#insid7=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region7/#aws ec2 terminate-instances --region $region7/g' ec2delete.sh
    completeprevent=SYDNEY
	read junk;;
8)  echo "DISABLE 8"
    sed -i 's/insid8=$(aws/#insid8=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region8/#aws ec2 terminate-instances --region $region8/g' ec2delete.sh
    completeprevent=TOKYO
	read junk;;
9)  echo "DISABLE 9"
    sed -i 's/insid9=$(aws/#insid9=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region9/#aws ec2 terminate-instances --region $region9/g' ec2delete.sh
    completeprevent=CANADA
	read junk;;
10) echo "DISABLE 10"
    sed -i 's/insid10=$(aws/#insid10=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region10/#aws ec2 terminate-instances --region $region10/g' ec2delete.sh
    completeprevent=FRANKFURT
	read junk;;
11) echo "DISABLE 11"
    sed -i 's/insid11=$(aws/#insid11=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region11/#aws ec2 terminate-instances --region $region11/g' ec2delete.sh
    completeprevent=IRELAND
	read junk;;
12) echo "DISABLE 12"
    sed -i 's/insid12=$(aws/#insid12=$(aws/g' ec2delete.sh
    sed -i 's/aws ec2 terminate-instances --region $region12/#aws ec2 terminate-instances --region $region12/g' ec2delete.sh
    completeprevent=LONDON
	read junk;;

Q|q) quit=y;; 

*) echo "Try Again" 

esac 
done 
echo "REGION [[... $completeprevent...]] HAS BEEN LOCKED FROM DELETE EC2 WHEN CRON RUNNING"
echo "Done"