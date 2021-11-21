# Set value here for MATCH
cd /home/ubuntu/includes

UPDATECODE=$(cat version.txt)
VERLOCK=$(cat version_lock.txt)

if [ $UPDATECODE > $VERLOCK ]
then
   echo "RUN UPDATE"
   chmod +x *.sh
   "Start updating"
   ./update.sh
    echo "UPDATECODE" > version_lock.txt
# START CREATE EBS PROGRESS


elif [ $UPDATECODE = $VERLOCK ]
then
   echo "NOT UPDATE"
fi
unset UPDATECODE
unset VERLOCK
