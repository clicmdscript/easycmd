#List of ami in each region

AMIRAN=("ami-0f8b8babb98cc66d0"
"ami-0252a84eb1d66c2a0"
"ami-081e530f100d962be"
"ami-0011abc177cfba83c")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
