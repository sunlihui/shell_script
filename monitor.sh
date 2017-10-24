#!/bin/bash

LOG_PATH=/usr/tomcat/webapps/Tuhu_SH_170821/data/log/trace.log
RECEIVER_LIST="2881030847@qq.com 18501659340@wo.cn"
TEMP_PATH=/tmp/error.log
KEY_WORD=INFO
tail -f $LOG_PATH | grep --line-buffered $KEY_WORD | awk '{print $3; fflush()}' | while read $KEY_WORD ; do tail -n 15 $LOG_PATH| grep --line-buffered $KEY_WORD >$TEMP_PATH;mail -s IVR01日志报错  $RECEIVER_LIST<$TEMP_PATH ; done
