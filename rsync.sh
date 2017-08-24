#!/bin/bash

#echo qk365 >/etc/rsyncd.passwords &&chmod 600 /etc/rsyncd.passwords
#cat >>/var/spool/cron/root <<eof
# backup data
#0 1 * * *  /root/shells/rsync.sh >/tmp/true.txt 2>/tmp/error.txt
#eof

PATH1=/qingke/tomcats
PATH2=/qingke/webapps

#1 Backup tomcats 
for i in `ls $PATH1`
do 
cd $PATH1
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords --exclude=logs ${i} qk365@10.10.10.200::tomcats_10.10.10.152;
done

#2 Backup webapps
for i in `ls $PATH2`
do
cd $PATH2
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords --exclude=WEB-INF/logs ${i} qk365@10.10.10.200::webapps_10.10.10.152;
done

#3 Backup appsconfig 
rsync -vzrtopg  --progress --delete --password-file=/etc/rsyncd.passwords  /qingke/appsconfig  qk365@10.10.10.200::appsconfig_10.10.10.152

#4 Backup nginx log
#rsync -vzrtopg --delete   --password-file=/etc/rsyncd.passwords  /etc/nginx/  qk365@10.10.10.200::nginx_10.10.10.151


