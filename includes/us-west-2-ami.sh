#List of ami in each region

AMIRAN=("ami-036d46416a34a611c"
"ami-09889d8d54f9e0a0e"
"ami-058b12f51d412b5db"
"ami-0688ba7eeeeefe3cd")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
