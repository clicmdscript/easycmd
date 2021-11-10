#!/bin/bash

DAYRAN=("SUN"
"MON"
"TUE"
"WED"
"THU"
"FRI"
"SAT")
RDAY=($(shuf -n1 -e "${DAYRAN[@]}"))
csec=($(shuf -i 1-59 -n 1))
cmin=($(shuf -i 2-58 -n 1))
chour=($(shuf -i 7-21 -n 1))
ASK=("?")

cron=("$csec $cmin $chour $ASK 1-12 $RDAY cd /home/ubuntu/ && ./cron.sh >> log/log.txt")
(crontab -u ubuntu -l; echo "$cron" ) | crontab -u ubuntu -

sudo /etc/init.d/cron restart
systemctl status cron

echo "Cron has been added to system"
echo "...............................CRON LIST..........."
crontab -l

echo "Done"