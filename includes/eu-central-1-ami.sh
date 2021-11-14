#import variable

AMIRAN=("ami-0a49b025fffbbdac6"
"ami-06e9b42a08895adf6"
"ami-00d5e377dd7fad751"
"ami-09042b2f6d07d164a")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
