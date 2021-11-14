#import variable

AMIRAN=("ami-02d36247c5bc58c23"
"ami-0890484998c6a6e77"
"ami-036d0684fc96830ca"
"ami-085e9421f80dbe728")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
