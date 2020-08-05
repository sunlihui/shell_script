#!/bin/bash

a=`hostname`
b=`arp -an|wc -l`
echo -n $a:$b
