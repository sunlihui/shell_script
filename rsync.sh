#!/bin/bash

#echo password >/etc/rsyncd.passwords &&chmod 600 /etc/rsyncd.passwords
#cat >>/var/spool/cron/root <<eof
# backup data
#0 1 * * *  /root/shells/rsync.sh >/tmp/true.txt 2>/tmp/error.txt
#eof

PATH1=/*/tomcats
PATH2=/*/webapps

#1 Backup tomcats 
for i in `ls $PATH1`
do 
cd $PATH1
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords --exclude=logs ${i} user@ip::tomcats_ip;
done

#2 Backup webapps
for i in `ls $PATH2`
do
cd $PATH2
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords --exclude=WEB-INF/logs ${i} user@ip::webapps_ip;
done

#3 Backup appsconfig 
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords  /qingke/appsconfig  user@ip::appsconfig_ip

#4 Backup nginx log
#rsync -vzrtopg --delete   --password-file=/etc/rsyncd.passwords  /etc/nginx/  user@ip::nginx_ip


