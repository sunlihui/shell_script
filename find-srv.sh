#!/bin/bash

#define parameter
file_save=1.txt
ip=*
ip_range="2 254"
>$file_save

for i in `seq ${ip_range}`;
do

if nc -z -w 1 ${ip}.$i 22 >>/dev/null 2>&1&&[ $? == 0 ]
then echo -n  $ip.$i linux >>$file_save
elif nc -z -w 1 ${ip}.$i 3389 >>/dev/null 2>&1 && [ $? == 0 ]
then echo -n $ip.$i windows >>$file_save
else echo -n $ip.$i Unknow >>$file_save
fi

if ping -c 1 ${ip}.$i >>/dev/null 2>&1&&[ $? == 0 ] 
then echo " Ping_OK">>$file_save
else
echo " Ping_down">>$file_save
fi

done

sort -k 2 $file_save -o $file_save
