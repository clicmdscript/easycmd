#!/bin/bash
#Auto disable region from delete cronjob
echo "Delete current ec2delete.sh and copy new file from includes/ec2delete.sh"
rm -rf ec2delete.sh
cp -rf includes/ec2delete.sh ec2delete.sh

AwsDefaultRegionName=$(head -1 .aws/DefaultRegionName.txt)
# 1 N.Virginia
if      [ $AwsDefaultRegionName = us-east-1 ]
            then
                echo "DISABLE 1 Virginia"
                sed -i 's/insid1=$(aws/#insid1=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region1/#aws ec2 terminate-instances --region $region1/g' ec2delete.sh
# 2 OHIO
elif    [ $AwsDefaultRegionName = us-east-2 ]
            then
                echo "DISABLE 2 OHIO"
                sed -i 's/insid2=$(aws/#insid2=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region2/#aws ec2 terminate-instances --region $region2/g' ec2delete.sh
# 3 N Califonia 
elif    [ $AwsDefaultRegionName = us-west-1 ]
            then
                echo "DISABLE 3 Califonia"
                sed -i 's/insid3=$(aws/#insid3=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region3/#aws ec2 terminate-instances --region $region3/g' ec2delete.sh
# 4 Oregon
elif    [ $AwsDefaultRegionName = us-west-2 ]
            then
                echo "DISABLE 4 OREGON"
                sed -i 's/insid4=$(aws/#insid4=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region4/#aws ec2 terminate-instances --region $region4/g' ec2delete.sh
# 5 SEOUL
elif    [ $AwsDefaultRegionName = ap-northeast-2 ]
            then
                echo "DISABLE 5 SEOUL"
                sed -i 's/insid5=$(aws/#insid5=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region5/#aws ec2 terminate-instances --region $region5/g' ec2delete.sh
# 6 SINGAPORE
elif    [ $AwsDefaultRegionName = ap-southeast-1 ]
            then
                echo "DISABLE 6 SINGAPORE"
                sed -i 's/insid6=$(aws/#insid6=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region6/#aws ec2 terminate-instances --region $region6/g' ec2delete.sh
# 7 SYDNEY
elif    [ ap-southeast-2 = $AwsDefaultRegionName ]
            then
                echo "DISABLE 7 SYDNEY"
                sed -i 's/insid7=$(aws/#insid7=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region7/#aws ec2 terminate-instances --region $region7/g' ec2delete.sh
# 8 TOKYO
elif    [ $AwsDefaultRegionName = ap-northeast-1 ]
            then
                echo "DISABLE 8 TOKYO"
                sed -i 's/insid8=$(aws/#insid8=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region8/#aws ec2 terminate-instances --region $region8/g' ec2delete.sh
# 9 CANADA
elif    [ $AwsDefaultRegionName = ca-central-1 ]
            then
                echo "DISABLE 9 CANADA"
                sed -i 's/insid9=$(aws/#insid9=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region9/#aws ec2 terminate-instances --region $region9/g' ec2delete.sh
# 10    FRANKFURT
elif    [ $AwsDefaultRegionName = eu-central-1 ]
            then
                echo "DISABLE 10 FRANKFURT"
                sed -i 's/insid10=$(aws/#insid10=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region10/#aws ec2 terminate-instances --region $region10/g' ec2delete.sh
# 11    IRELAND
elif    [ $AwsDefaultRegionName = eu-west-1 ]
            then
                echo "DISABLE 11 IRELAND"
                sed -i 's/insid11=$(aws/#insid11=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region11/#aws ec2 terminate-instances --region $region11/g' ec2delete.sh
# 12    LONDON
elif    [ $AwsDefaultRegionName = eu-west-2 ]
            then
                echo "DISABLE 12 LONDON"
                sed -i 's/insid12=$(aws/#insid12=$(aws/g' ec2delete.sh
                sed -i 's/aws ec2 terminate-instances --region $region12/#aws ec2 terminate-instances --region $region12/g' ec2delete.sh
else
                echo ".Aws/DefaultRegion.txt not Found, Please run it with Manual from file ./prevent-region.sh"

fi

echo "Disable region complete"
