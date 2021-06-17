#!/bin/bash
# 以下脚本是修改jumpserver数据库，达到对特定授权进行指定时间段授权

username="user_jumpserver"
passwd="8888888"
host="db-host"
dbname="jumpserver"

date1=`date +%Y-%m-%d`
date2=`date +%Y-%m-%d --date="+1 day"`
date_start="$date1 12:00:00"
date_expired="$date2 00:00:00"
NAME="资产授权1;资产授权2;资产授权3"

OLDIFS=$IFS
IFS=$';'

for name in $NAME
do
mysql -u$username -h$host -p$passwd $dbname -e "update perms_assetpermission set date_start=STR_TO_DATE('$date_start','%Y-%m-%d %H:%i:%s') where name='$name';"
mysql -u$username -h$host -p$passwd $dbname -e "update perms_assetpermission set date_expired=STR_TO_DATE('$date_expired','%Y-%m-%d %H:%i:%s') where name='$name';"
done
