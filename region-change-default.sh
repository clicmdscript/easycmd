#!/bin/bash
read -p "Enter text with Name of default region like:: US-EAS***: \

# 1     N.Virginia  us-east-1
# 2     OHIO        us-east-2
# 3     N.Califonia us-west-1
# 4     Oregon      us-west-2
# 5     SEOUL       ap-northeast-2
# 6     SINGAPORE   ap-southeast-1
# 7     SYDNEY      ap-southeast-2
# 8     TOKYO       ap-northeast-1
# 9     CANADA      ca-central-1
# 10    FRANKFURT   eu-central-1
# 11    IRELAND     eu-west-1
# 12    LONDON      eu-west-2

Select one region:: " AWS_DEFAULT_RGION_NEW
echo $AWS_DEFAULT_RGION_NEW > .aws/DefaultRegionName.txt

./region-auto-lock.sh
echo "Region has been change to::: $AWS_DEFAULT_RGION_NEW"
echo ""


