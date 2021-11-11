#!/bin/bash
    cd /home/ubuntu
    git clone https://github.com/clicmdscript/easycmd.git
    cd easycmd/
    mv *.sh /home/ubuntu
    cd ..
    rm -rf easycmd/
    chmod +x *.sh
    ./install_awscli.sh
    

n=1
while [ $n -lt 5 ]
do
        current_time=$(date "+%Y.%m.%d-%H.%M")
        echo "RunTime now = $n"
        ./cron.sh > log/$current_time-runscreen.txt
sleep 100000s
        echo "Done"
            ((n=$n+1))
done