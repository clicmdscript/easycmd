#!/bin/bash
# Function generate content email to smessage.txt
cd /home/ubuntu && cp -r accountname.txt mail/accountname.txt
accaxxname=$(head -1 accountname.txt)
cd /home/ubuntu/log && cp -r log_addcron.txt /home/ubuntu/mail/log_addcron.txt
nextschedule=$(head -3 log_addcron.txt)
echo "CRONJOB DEL & CREATE HAS BEEN COMPLETED ON"
echo "$accaxxname"
echo""
echo "Next run schedule"
echo""
echo "$nextschedule"
echo ""