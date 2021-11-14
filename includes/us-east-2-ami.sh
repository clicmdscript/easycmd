#List of ami in each region

AMIRAN=("ami-0629230e074c580f2"
"ami-08c213ebdf7b857c2"
"ami-020db2c14939a8efb"
"ami-0b46a92f7aa2df347")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
