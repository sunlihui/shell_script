#!/bin/bash

# coredns使用脚本
# 注意 这里判断变量为空的时候用 -n "变量"，一定要加"",不然当变量为空的时候，不识别会报错，具体可以sh -x 调试时候看到

# 定义函数
coredns ()
{
PID='pgrep coredns'
RPID=`cat /var/run/coredns`
#nohup ./coredns -conf /etc/coredns.conf >>/var/log/coredns/dns.log 2>&1 &
case $1 in
    start) 
    if [ -n "${RPID}" ];
    then
    ps -ef |grep ${RPID}|grep -v grep ; echo "程序已经在运行，请再次确认！"
    else
    nohup /opt/coredns-master/coredns -conf /etc/coredns.conf >>/var/log/coredns/dns.log 2>&1 &  sleep 3 && echo `$PID`>/var/run/coredns
    fi
    ;;
    stop)
    if [ -n "${RPID}" ];
    then
    kill -15 ${RPID} ;sleep 2 && >/var/run/coredns;echo "程序已停止"
    else
    echo "程序已经终止，请再次确认！"
    fi
    ;;
    restart) 
    if [ -n "${RPID}" ];
    then
    kill -15 ${RPID} ;sleep 2 && nohup /opt/coredns-master/coredns -conf /etc/coredns.conf >>/var/log/coredns/dns.log 2>&1 &  sleep 2 && echo `$PID`>/var/run/coredns
    else
    nohup /opt/coredns-master/coredns -conf /etc/coredns.conf >>/var/log/coredns/dns.log 2>&1 &  sleep 2 && echo `$PID`>/var/run/coredns
    fi
    ;;
    status) 
    if [ -n "${RPID}" ];
    then
    ps -ef |grep ${RPID}|grep -v grep
    else
    echo "程序未运行"
    fi
    ;;
    *) echo 'Usage:|start|restart|status|'
    ;;
esac
}

coredns $1

#ssh 10.100.142.242 "/opt/001_coredns.sh $1"
#ssh 10.100.142.242 "/opt/001_dns.sh status"
