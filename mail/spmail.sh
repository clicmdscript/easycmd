#!/bin/bash
# Run aws.check-limit to smessage.txt file
cd /home/ubuntu/mail
source emailconf.sh
sleep_time=($(shuf -i 2-13 -n 1))
sleep $sleep_time

cd /home/ubuntu/mail && ./smessage.sh > smessage.txt

#Start sending mail
./smtp-cli --missing-modules-ok \
--host  $hostnport \
--enable-auth --user $userapijet --password $userpassjet \
--from $mailfroms --to $mailtos \
--data $messtxt

echo "Send mail delete & create done"

