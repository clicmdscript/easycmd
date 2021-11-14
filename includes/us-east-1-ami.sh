#import variable

AMIRAN=("ami-083654bd07b5da81d"
"ami-0279c3b3186e54acd"
"ami-0416f96ae3d1a3f29"
"ami-087107f9778206adb")
amiubuntu=($(shuf -n1 -e "${AMIRAN[@]}"))
