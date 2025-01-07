#!/bin/bash

#USAGE=$(df -hT | grep -i xfs | awk -F " " {print $Nf})

#echo $USAGE

disk=$(df -hT | grep -i xfs)

#echo $disk

while read -r line
do
    usage=$(echo $line | awk -F " " {print 6f})
done <<< $disk

echo $usage