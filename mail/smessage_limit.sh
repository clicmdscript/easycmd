#!/bin/bash
# Function generate content email to smessage_limit.txt

accaxxname=$(head -1 /home/ubuntu/accountname.txt)
Currentlimit=$(head -1 limit.txt)
echo "LIMIT AND MONITORING:"
echo "$accaxxname"
echo""
echo "Current limit: $Currentlimit "
echo ""