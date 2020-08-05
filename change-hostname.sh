#!/bin/bash

list=`cat change-hostname-list`
#for i in $list;do echo $i;done
for i in $list;do ansible $i -m shell -a "hostnamectl set-hostname $i";done
