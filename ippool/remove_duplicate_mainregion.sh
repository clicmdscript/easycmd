#!/bin/bash

# count all line in all file of dir and select file have start of 2 or 3 line
bigfileline=$(wc -l *-*.txt | awk '$1 ~ /^[2-4]*$/')

# echo file name ap-southeast-1 to needtodelete.txt
echo $bigfileline | egrep "us*|eu*|ap*|ca*" | grep "" | cut -b 3-20 > needtodelete1.txt
# cat needtodelete = ap-southeast-1.txt 
deleteinregion=$(head -1 needtodelete1.txt)

#exclude IP of control vps
MYIP4="MYIP4";
if cat myip4.txt | grep -v grep | grep $MYIP4 > /dev/null
then
        echo "$MYIP4 Exits." 
        myip4=$(cat myip4.txt)
        echo "IP use= $myip4";
		
else
        echo "$PROCESS not exits, get IP4 and save it to myip4.txt" ;
        curl http://checkip.amazonaws.com > myip4.txt
           
fi
myip4=$(head -1 myip4.txt)

grep -v "$myip4" $deleteinregion > tobedelete2.txt
regiontouseinthis=$(cat needtodelete1.txt | rev | cut -c5- | rev)
bedel1=$(sed -n '1p' tobedelete2.txt)
bedel2=$(sed -n '2p' tobedelete2.txt)

# get instance id from ip-address
aws ec2 describe-instances --filters "Name=ip-address,Values=$bedel1" | jq -r .Reservations[0].Instances[0].InstanceId > idel1.txt
aws ec2 describe-instances --filters "Name=ip-address,Values=$bedel2" | jq -r .Reservations[0].Instances[0].InstanceId > idel2.txt

idel1=$(head -1 idel1.txt)
idel2=$(head -1 idel2.txt)
# delete instance id
aws ec2 terminate-instances --region $regiontouseinthis --instance-ids $idel1
aws ec2 terminate-instances --region $regiontouseinthis --instance-ids $idel2


echo "complete"

