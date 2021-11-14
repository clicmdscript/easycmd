#List of region for random check limit

DEFRGRAND=("us-east-1"
"us-east-2"
"us-west-1"
"us-west-2"
"ap-southeast-1")

defregioned=($(shuf -n1 -e "${DEFRGRAND[@]}"))