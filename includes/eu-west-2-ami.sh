#import variable

AMIRAN=("ami-0fdf70ed5c34c5f52"
"ami-0f9853ca76d115e7b"
"ami-008485ca60c91a0f3"
"ami-0d91ffaa00cb69c53")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
