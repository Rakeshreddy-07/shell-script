#!/bin/bash

#USAGE=$(df -hT | grep -i xfs | awk -F " " {print $Nf})

#echo $USAGE

disk=$(df -hT)

echo $disk

while read -r line
do
    echo $line
done <<< $disk