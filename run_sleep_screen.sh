#!/bin/bash

n=1
while [ $n -lt 5 ]
do
        current_time=$(date "+%Y.%m.%d-%H.%M")
        echo "RunTime now = $n"
        cd /home/ubuntu && ./cron.sh > log/$current_time.txt
sleep 100000s
        echo "Done"

            ((n=$n+1))
done