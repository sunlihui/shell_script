#!/bin/bash

i=1
sum=0
while ((i <= 100))
do
    ((sum += i))
    ((i++))
    echo lihui >>/tmp/
done
echo "The sum is: $sum"
