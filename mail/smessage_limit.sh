#!/bin/bash
# Function generate content email to smessage_limit.txt

cd /home/ubuntu && cp -r accountname.txt mail/accountname.txt
accaxxname=$(head -1 accountname.txt)

Currentlimit=$(head -1 limit.txt)
echo "LIMIT MONITORING: $Currentlimit"
echo "$accaxxname"
echo""
echo "Current limit: $Currentlimit "
echo ""