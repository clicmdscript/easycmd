#List of ami in each region

AMIRAN=("ami-053ac55bdcfe96e85"
"ami-083f68207d3376798"
"ami-0eb06829aa9b10ef4"
"ami-0454207e5367abf01")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
