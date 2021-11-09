#!/bin/bash

cd /root/
./ec2delete.sh

r=$((RANDOM%11))      # generates a number in the range of 0 to 2
command[0]="./us-east-1.sh"
command[1]="./us-east-2.sh"
command[2]="./us-west-1.sh"
command[3]="./us-west-2.sh"
command[4]="./ap-northeast-2.sh"
command[5]="./ap-southeast-1.sh"
command[6]="./ap-southeast-2.sh"
command[7]="./ap-northeast-1.sh"
command[8]="./ca-central-1.sh"
command[9]="./eu-central-1.sh"
command[10]="./eu-west-1.sh"
command[11]="./eu-west-2.sh"

eval ${command[$r]}  # executes command
unset command r 


#!/bin/bash
#random_selection=$((RANDOM % 11))

#case $random_selection in

 # 0)
 # <command_1>
 # ;;

#1)
# <command_2>
# ;;
#
 # 2)
 # <command_3>
 # ;;
#
#  3)
#  <command_4>
 # ;;
#
#esac