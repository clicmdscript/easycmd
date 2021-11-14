#InstancesType

INSRAND=("t2.micro"
"t2.small"
"t2.medium"
"t3.nano"
"t3.micro"
"t3.small")
instancesType=($(shuf -n1 -e "${INSRAND[@]}"))
