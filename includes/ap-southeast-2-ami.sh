#List of ami in each region

AMIRAN=("ami-0bf8b986de7e3c7ce"
"ami-00803a3c61ac12ee2"
"ami-00abf0511a7f4cee5"
"ami-0672b175139a0f8f4")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
