#!/bin/bash

rm -rf cronjobgen.txt
crontab -r

cmin=($(shuf -i 2-58 -n 1))
chour=($(shuf -i 7-21 -n 1))
cday=($(shuf -i 4-5 -n 1))

tee -a cronjobgen.txt <<EOF
$cmin $chour */$cday * * cd /home/ubuntu/ && ./cron.sh >> log/log.txt
$cmin $chour */$cday * * cd /home/ubuntu/ && ./add_cronjob.sh >> log/log_addcron.txt
EOF

cronjobgen=$(head -2 cronjobgen.txt)
(crontab -u ubuntu -l; echo "$cronjobgen" ) | crontab -u ubuntu -

echo "Cron has been added to system"
echo "..................CRON LIST..............................."
crontab -l

echo "Install new cronjob complete"
