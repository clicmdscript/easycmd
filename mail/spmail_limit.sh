#!/bin/bash
# Run aws.check-limit to limit.txt file
source emailconf.sh
sleep_time=($(shuf -i 2-16 -n 1))
sleep $sleep_time
cd /home/ubuntu/ && ./aws.check-limit.sh > limit.txt
cd /home/ubuntu/mail && ./smessage_limit.sh > smessage_limit.txt

#Start sending mail
./smtp-cli --missing-modules-ok \
--host  $hostnport \
--enable-auth --user $userapijet --password $userpassjet \
--from $mailfroms --to $mailtos \
--data $messtxtlimit

echo "Send Email limit done"

