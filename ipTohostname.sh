#!/bin/bash
#create by sunlihui @2020-08-05 15:00:49


# example  
# /usr/bin/nslookup IP |grep name|cut -d'=' -f2|cut -d'.' -f1-4

# 在此录入ip文件位置,文件内容格式如下：
# 10.1.1.1
# 10.1.1.2

filename=/etc/ansible/hosts-linux-vm
outfilename=hostname.txt

for IP in `cat $filename`;
do /usr/bin/nslookup $IP |grep name|cut -d'=' -f2|cut -d'.' -f1-4 >>$outfilename;
done

