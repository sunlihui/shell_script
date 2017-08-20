#!/bin/bash

#!/bin/bash


BASE_DIR='/qingke/backup/mysql'
mydate=`date +%Y-%m-%d_%H%M%S`
BACKUP_DIR=${BASE_DIR}/${mydate}
mysqluser='root';
mysqlpasswd='Uj7885876ipquyhKjtbI'
mysql_dump='/usr/bin/mysqldump'

rm -rf $BACKUP_DIR  >/dev/null 2>&1
mkdir -p $BACKUP_DIR  >/dev/null 2>&1


echo "dumping mysql..."
$mysql_dump -u $mysqluser -p$mysqlpasswd --default-character-set=utf8  --single-transaction qkpay | gzip > ${BACKUP_DIR}/qkpay.sql.gz

$mysql_dump -u $mysqluser -p$mysqlpasswd --default-character-set=utf8  --single-transaction nctest | gzip > ${BACKUP_DIR}/nctest.sql.gz
echo "mysql dump done."
sleep 2

#mysqldump -uroot -pUj7885876ipquyhKjtbI qkpay>qkpay-.sql
#mysqldump -uroot -pUj7885876ipquyhKjtbI nctest>nctest-20161011.sql
