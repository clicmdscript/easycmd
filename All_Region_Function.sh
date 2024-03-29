# Function task
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
        echo "Create Security Group...."
        sgscnumbername=($(shuf -i 4-300 -n 1))
        launchwizard="launch-wizard-$sgscnumbername"
        aws ec2 create-security-group --region $region --description $launchwizard --group-name $launchwizard 

#get security group id
        echo "Get Security Group ID name...."
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
        echo "Get SubID name"
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

# Create EC2
        echo "Start create new EC2"
aws ec2 run-instances --region $region \
        --image-id $amiubuntu \
        --count 1 \
        --instance-type $instancesType \
        --key-name $keyname \
        --security-group-ids $SecurityGroup \
        --subnet-id $SubnetId \
        --query 'Instances[0].InstanceId' \
        --output text > log/$region.log

# Get Instance ID from file .log
IDinstance_justcreated=$(cat log/$region.log)
echo "Get Name instance ID just create: $IDinstance_justcreated"
# Set value here for MATCH
VarOkif=(
"1"
"2"
"3"
"4"
"5")
OK_IF=($(shuf -n1 -e "${VarOkif[@]}"))

BEOK=3
if [ $BEOK == $OK_IF ]
then
   echo "------- $OK_IF ---------->>>>>>>>>>--RUN CREATE EBS"
# START CREATE EBS PROGRESS

# Get detail of EC2: AvailabilityZone
Detail_subzone=$(aws ec2 describe-instances \
        --region $region \
        --instance-ids $IDinstance_justcreated | sed -r -n -e '/^[[:space:]]*"AvailabilityZone":/s/^[^:]*: *"(.*)", *$/\1/p')
echo "Subzone of Instance: $Detail_subzone"
# Gen random GB for EBS create
EBS_Size=($(shuf -i 5-30 -n 1))

# Create EBS volume and save log to -ebs.log
aws ec2 create-volume \
        --region $region \
        --size $EBS_Size \
        --availability-zone $Detail_subzone | sed -r -n -e '/^[[:space:]]*"VolumeId":/s/^[^:]*: *"(.*)", *$/\1/p' > log/$region-ebs.log

#Create var VolID with cat VolumeID at log/region-ebs.log file
VolID_EBS=$(cat log/$region-ebs.log)

#waiting for EC2 running and startup
TIME_WAIT_RUNNING=($(shuf -i 35-60 -n 1))
sleep $TIME_WAIT_RUNNING
#aws ec2 wait instance-running \ 
#        --instance-ids $IDinstance_justcreated

#Start Attact EBS to EC2
aws ec2 attach-volume \
        --region $region \
        --volume-id $VolID_EBS \
        --instance-id $IDinstance_justcreated \
        --device /dev/sdf
echo "........................................................."        
echo "Result............."
echo "Region working:   $region"
echo "Instance type:    $instancesType"
echo "Keyname:          $keyname"
echo "SecuryGroup:      $SecurityGroup"
echo "Subnet:           $SubnetId"
echo "Instance ID:      $IDinstance_justcreated"
echo "Sub zone:         $Detail_subzone"
echo "EBS size:         $EBS_Size"
echo "EBS vol-id:       $VolID_EBS"
echo "........................................................."
#END CREATE EBS

elif [ $a != $b ]
then
   echo "-------== $OK_IF ==---------->>>>>>>>>>--CANCEL CREATE EBS"
fi
unset OK_IF
# finish
echo "COMPLETE for region: $region"
