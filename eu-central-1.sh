#!/bin/bash
cd /home/ubuntu
#import variable
region=eu-central-1
       source /home/ubuntu/includes/_ec2_type.sh
        source /home/ubuntu/includes/$region-ami.sh
#get keyname in temp/
aws ec2 describe-key-pairs --key-name --region $region | jq . > /home/ubuntu/temp/keyname.json
keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' /home/ubuntu/temp/keyname.json)
#   var $keyname
PROCESS="KeyName";
if cat temp/keyname.json | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS Exits. Start create EC2" ;
		#nothing todo
else
        echo "$PROCESS not exits, create new keyname" ;
                source /home/ubuntu/includes/list_words_arr.sh
                rm -rf /home/ubuntu/temp/tmphex.txt
                tmphex=$WORDTOUSE
                echo "$tmphex" > /home/ubuntu/temp/tmphex.txt
                keynamenew=$(head -1 /home/ubuntu/temp/tmphex.txt)$DOT$region
                aws ec2 create-key-pair \
                --key-name $keynamenew \
                --region $region \
                --query 'KeyMaterial' \
                --output text > keypem/$keynamenew.pem
fi

echo "Keyname completed"
echo "Get Keyname again for create EC2"
        aws ec2 describe-key-pairs --key-name --region $region | jq . > /home/ubuntu/temp/keyname.json
        keyname=$(sed -r -n -e '/^[[:space:]]*"KeyName":/s/^[^:]*: *"(.*)", *$/\1/p' /home/ubuntu/temp/keyname.json)

#create security group
        sgscnumbername=($(shuf -i 4-99 -n 1))
        launchwizard="launch-wizard-$sgscnumbername"
        aws ec2 create-security-group --region $region --description $launchwizard --group-name $launchwizard 

#get security group id
        aws ec2 describe-security-groups --region $region | jq . > /home/ubuntu/temp/securitygr.json
        sed -r -n -e '/^[[:space:]]*"GroupId":/s/^[^:]*: *"(.*)", *$/\1/p' /home/ubuntu/temp/securitygr.json > /home/ubuntu/temp/temgroup.txt
        rm -rf /home/ubuntu/temp/ScGroupArr.txt
        mapfile -t myArray < /home/ubuntu/temp/temgroup.txt
                while IFS= read -r line;
                        do echo 444-"$line"-555;
                done < /home/ubuntu/temp/temgroup.txt > /home/ubuntu/temp/ScGroupArr.txt
        sed -i 's/444-/"/' /home/ubuntu/temp/ScGroupArr.txt
        sed -i 's/-555/"/' /home/ubuntu/temp/ScGroupArr.txt
        ArrScGroupDb=$(</home/ubuntu/temp/ScGroupArr.txt)
# var $vArrScGroupDbalue
        rm -rf /home/ubuntu/temp/ScGroupArr_use.sh
        tee -a /home/ubuntu/temp/ScGroupArr_use.sh <<EOF
                ScGroupArr=(
                $ArrScGroupDb
                ) 
EOF

chmod +x /home/ubuntu/temp/ScGroupArr_use.sh
        source /home/ubuntu/temp/ScGroupArr_use.sh
        SecurityGroup=($(shuf -n1 -e "${ScGroupArr[@]}"))

# get subnet id
        aws ec2 describe-subnets --region $region | jq . > /home/ubuntu/temp/SubnetId.json
        sed -r -n -e '/^[[:space:]]*"SubnetId":/s/^[^:]*: *"(.*)", *$/\1/p' /home/ubuntu/temp/SubnetId.json > /home/ubuntu/temp/tempsubnet.txt
#SubnetId=$(head -1 temp/tempsubnet.txt)
# create array for subnetid
        rm -rf /home/ubuntu/temp/subnetid2.txt
        mapfile -t myArray < /home/ubuntu/temp/tempsubnet.txt
                while IFS= read -r line;
                        do echo 444-"$line"-555;
                done < /home/ubuntu/temp/tempsubnet.txt > /home/ubuntu/temp/subnetid2.txt
        sed -i 's/444-/"/' /home/ubuntu/temp/subnetid2.txt
        sed -i 's/-555/"/' /home/ubuntu/temp/subnetid2.txt
        ArrSubnetID=$(</home/ubuntu/temp/subnetid2.txt)
        rm -rf /home/ubuntu/temp/ArrSubnetID_use.sh
        tee -a /home/ubuntu/temp/ArrSubnetID_use.sh <<EOF
        SubNetIDArr=(
                $ArrSubnetID
                )
EOF
chmod +x /home/ubuntu/temp/ArrSubnetID_use.sh
        source /home/ubuntu/temp/ArrSubnetID_use.sh
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
