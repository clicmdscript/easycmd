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



# get special line in file
sed -n '2,2p' file.txt

# count number line in file
cat -n file01.txt | tail -1 | awk '{print $1}'


sec_number_a=$(cat -n temgroup.txt | tail -1 | awk '{print $1}')
sec_number_b=2

if [ "$sec_number_a" -ge "$sec_number_b" ]
     then
        echo       "create subnet"
     else
        echo       "create ec2"
fi
