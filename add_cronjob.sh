#!/bin/bash

cron="1-58 22-23 */4 * 1-7 sudo sh /home/ubuntu/cron.sh"
(crontab -u ubuntu -l; echo "$cron" ) | crontab -u ubuntu -

