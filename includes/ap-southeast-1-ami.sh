#List of ami in each region

AMIRAN=("ami-07191cf2912e097a6"
"ami-0fed77069cd5a6d6c"
"ami-0907c2c44ea451f84"
"ami-0bd2beaddfd6419fc")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
