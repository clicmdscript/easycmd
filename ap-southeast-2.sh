#!/bin/bash
cd /home/ubuntu
#import variable
region=ap-southeast-2
        source includes/_ec2_type.sh
        source includes/$region-ami.sh
#get keyname in temp/
aws ec2 describe-key-pairs --key-name --region $region | jq . > temp/keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' temp/keyname.json)
#   var $keyname
PROCESS="KeyName";
if cat temp/keyname.json | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS Exits. Start create EC2" ;
		#nothing todo
else
        echo "$PROCESS not exits, create new keyname" ;
                source includes/list_words_arr.sh
                rm -rf temp/tmphex.txt
                tmphex=$WORDTOUSE
                echo "$tmphex" > temp/tmphex.txt
                keynamenew=$(head -1 temp/tmphex.txt)$DOT$region
                aws ec2 create-key-pair \
                --key-name $keynamenew \
                --region $region \
                --query 'KeyMaterial' \
                --output text > keypem/$keynamenew.pem
fi

echo "Keyname completed"
echo "Get Keyname again for create EC2"
        aws ec2 describe-key-pairs --key-name --region $region | jq . > temp/keyname.json
        keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' temp/keyname.json)

#create security group
        sgscnumbername=($(shuf -i 4-99 -n 1))
        launchwizard="launch-wizard-$sgscnumbername"
        aws ec2 create-security-group --region $region --description $launchwizard --group-name $launchwizard 

#get security group id
        aws ec2 describe-security-groups --region $region | jq . > temp/securitygr.json
        sed -r -n -e '/^[[:space:]]*"GroupId":/s/^[^:]*: *"(.*)", *$/\1/p' temp/securitygr.json > temp/temgroup.txt
        rm -rf temp/ScGroupArr.txt
        mapfile -t myArray < temp/temgroup.txt
                while IFS= read -r line;
                        do echo 444-"$line"-555;
                done < temp/temgroup.txt > temp/ScGroupArr.txt
        sed -i 's/444-/"/' temp/ScGroupArr.txt
        sed -i 's/-555/"/' temp/ScGroupArr.txt
        ArrScGroupDb=$(<temp/ScGroupArr.txt)
# var $vArrScGroupDbalue
        rm -rf temp/ScGroupArr_use.sh
        tee -a temp/ScGroupArr_use.sh <<EOF
                ScGroupArr=(
                $ArrScGroupDb
                ) 
EOF

chmod +x temp/ScGroupArr_use.sh
        source temp/ScGroupArr_use.sh
        SecurityGroup=($(shuf -n1 -e "${ScGroupArr[@]}"))

# get subnet id
        aws ec2 describe-subnets --region $region | jq . > temp/SubnetId.json
        sed -r -n -e '/^[[:space:]]*"SubnetId":/s/^[^:]*: *"(.*)", *$/\1/p' temp/SubnetId.json > temp/tempsubnet.txt
#SubnetId=$(head -1 temp/tempsubnet.txt)
# create array for subnetid
        rm -rf temp/subnetid2.txt
        mapfile -t myArray < temp/tempsubnet.txt
                while IFS= read -r line;
                        do echo 444-"$line"-555;
                done < temp/tempsubnet.txt > temp/subnetid2.txt
        sed -i 's/444-/"/' temp/subnetid2.txt
        sed -i 's/-555/"/' temp/subnetid2.txt
        ArrSubnetID=$(<temp/subnetid2.txt)
        rm -rf temp/ArrSubnetID_use.sh
        tee -a temp/ArrSubnetID_use.sh <<EOF
        SubNetIDArr=(
                $ArrSubnetID
                )
EOF
chmod +x temp/ArrSubnetID_use.sh
        source temp/ArrSubnetID_use.sh
        SubnetId=($(shuf -n1 -e "${SubNetIDArr[@]}"))
# Var $SubnetId
#create
aws ec2 run-instances --region $region \
        --image-id $amiubuntu \
        --count 1 \
        --instance-type $instancesType \
        --key-name $keyname \
        --security-group-ids $SecurityGroup \
        --subnet-id $SubnetId \
        --query 'Instances[0].InstanceId' \
        --output text
# finish
echo "Create done"
