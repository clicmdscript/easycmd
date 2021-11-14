#import variable

AMIRAN=("ami-08edbb0e85d6a0a07"
"ami-095b735dce49535b5"
"ami-06938675032090695"
"ami-00995a2792e96c569")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
