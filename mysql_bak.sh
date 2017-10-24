#!/bin/bash

#备份日期
mydate=`date +%Y-%m-%d_%H:%M:%S`
#备份路径
BASE_DIR='/backup/mysql'
BACKUP_DIR=${BASE_DIR}/${mydate}
#备份数据库信息
mysqluser='root'
mysqlpasswd='root'
mysql_dump='/mysql/bin/mysqldump'
db_name=zabbix

rm -rf $BACKUP_DIR  >/dev/null 2>&1
mkdir -p $BACKUP_DIR  >/dev/null 2>&1


echo "dumping mysql..."
$mysql_dump -u $mysqluser -p$mysqlpasswd --default-character-set=utf8  --single-transaction $db_name | gzip > ${BACKUP_DIR}/${db_name}.sql.gz

echo "mysql dump done."
sleep 2
