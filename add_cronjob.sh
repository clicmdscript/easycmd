#!/bin/bash

cron="1-58 3-23 4,8,13,18,22,26,30 * * sh /home/ubuntu/cron.sh > /home/ubuntu/log/log.txt"
(crontab -u ubuntu -l; echo "$cron" ) | crontab -u ubuntu -

sudo /etc/init.d/cron restart
systemctl status cron

