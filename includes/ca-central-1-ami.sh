#import variable

AMIRAN=("ami-0bb84e7329f4fa1f7"
"ami-0bb84e7329f4fa1f7"
"ami-04ce2d3d06e88b4cf"
"ami-0e471deaa43652c4a")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
