#!/bin/bash

# 关机重启命令知悉

## shutdown
#1 10分钟关闭计算机
#/sbin/shutdown -h 10 'I will shutdow this machine after 10 mins!'

#2 立刻关机
# shutdown -h now

#3 指定时间关机
# shutdown -h 20:25

#4 系统立刻重新开机
# shutdown -r now

# 再过30分钟系统会重启，并通知用户
# shutdown -r +30 'This system will reboot after 30 mins'

## 记住重启关机请劲量多的执行 sync;sync;sync
 
