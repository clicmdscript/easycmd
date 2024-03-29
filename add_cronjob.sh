#!/bin/bash
cd /home/ubuntu
# Remove current cronjob file generate and cronjob
rm -rf log/cronjobgen.txt
crontab -r

# Variable for cronjob delete, create ec2
cmin=($(shuf -i 2-58 -n 1))
chour=($(shuf -i 7-21 -n 1))
cday=($(shuf -i 2-4 -n 1))
 # Variable for cronjob generate sending email of limit and time for adding add_crontab.sh with sleep 10 delay
lmcmin=($(shuf -i 10-57 -n 1))
lmchour=($(shuf -i 6-22 -n 1))
lmcday=($(shuf -i 6-7 -n 1))

# Create new content of log/cronjobgen.txt. Use for add_cronjob task and SPmail_limit
tee -a log/cronjobgen.txt <<EOF
$lmcmin $lmchour */$lmcday * * cd /home/ubuntu/ && sleep 10 && ./add_cronjob.sh >> log/log_addcron.txt
EOF

# Add cronjob to system
cronjobgen=$(head -3 log/cronjobgen.txt)
(crontab -u ubuntu -l; echo "$cronjobgen" ) | crontab -u ubuntu -
echo "Crontab for DELETE AND CREATE IS COMPLETE"
echo "=========================================================="
# Add cron to /etc/crontab with sudo
#backup file crontab goc
rm -rf log/cronjobgenetc.*
rm -rf log/etc_crontab_default.sh
#create default content
tee -a log/cronjobgenetc.txt <<EOF
$cmin $chour */$cday * *    ubuntu  cd /home/ubuntu/ && ./cron.sh >> log/log.txt
$lmcmin $lmchour */$lmcday * *       ubuntu  cd /home/ubuntu/mail && ./spmail_limit.sh
EOF

tee -a log/etc_crontab_default.sh <<EOF
sudo echo "SHELL=/bin/sh" > /etc/crontab
sudo echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/crontab
sudo echo "17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly" >> /etc/crontab
sudo echo "25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )" >> /etc/crontab
sudo echo "47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )" >> /etc/crontab
sudo echo "52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )" >> /etc/crontab
EOF

chmod +x log/etc_crontab_default.sh
cd log/
sudo ./etc_crontab_default.sh
cd ..
#start create new crontab for checking limit
cronjobgenetc=$(head -2 log/cronjobgenetc.txt)
tee -a log/cronjobgenetc.sh <<EOF
#!/bin/bash
sudo echo "$cronjobgenetc" >> /etc/crontab
EOF
chmod +x log/cronjobgenetc.sh
cd log/
sudo ./cronjobgenetc.sh
cd ..

cat /etc/crontab
echo "=========================================================="
echo "Cron has been added to system"
echo "..................CRON LIST................................"

echo "Install new cronjob complete"
