#!/bin/bash

DIR=${PWD}
Flag=$DIR/flag.txt

function SyncFileToTx() {
	#rsync -azPp --bwlimit=1 --delete /tmp/test/ root@tx1-arch-confluence-bak-1:/tmp/test >>/data/backup/backup-rsync-data.log 2>&1;echo $?>${Flag}
	rsync -azPp --bwlimit=15000  --delete /data/atlassian/confluence/  root@tx1-arch-confluence-bak-1:/data/atlassian/confluence >>/data/backup/backup-rsync-data.log 2>&1;echo $?>${Flag}
	rsync -azPp --bwlimit=15000  --delete /data/atlassian/confluence-data/  root@tx1-arch-confluence-bak-1:/data/atlassian/confluence-data >>/data/backup/backup-rsync-data.log 2>&1;echo $?>${Flag}
}

function AfterSyncSuccess() {
	ssh root@tx1-arch-confluence-bak-1 "echo YES >/data/backup/scripts/INFO"; echo "传送confluence-data到腾讯云成功!">>/data/backup/backup-rsync-data.log
	echo `date`>>/data/backup/backup-rsync-data.log;echo "-----------备份日期分隔-------------------" >>/data/backup/backup-rsync-data.log
}

SyncFileToTx

FLAG=`cat $Flag`
if [[ $FLAG == 0 ]] || [[ $FLAG = 24 ]]
then
        AfterSyncSuccess
else
        echo "传输文件不成功，请处理！">>/data/backup/backup-rsync-data.log
        echo `date`>>/data/backup/backup-rsync-data.log;echo "-----------备份日期分隔-------------------" >>/data/backup/backup-rsync-data.log
fi