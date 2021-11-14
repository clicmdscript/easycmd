#!/bin/bash
# Function generate content email to smessage.txt

accaxxname=$(head -1 ../accountname.txt)
nextschedule=$(head -3 ../log/log_addcron.txt)
echo "CRONJOB DEL & CREATE HAS BEEN COMPLETED ON"
echo "$accaxxname"
echo""
echo "Next run schedule"
echo""
echo "$nextschedule"
echo ""