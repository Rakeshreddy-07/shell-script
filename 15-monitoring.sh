#!/bin/bash

#USAGE=$(df -hT | grep -i xfs | awk -F " " {print $Nf})

#echo $USAGE

disk=$(df -hT | grep xfs)
threshold=5


while read -r line
do
    usage=$(echo $line | awk -F " " '{ print $6f }' | cut -d "%" -f 1)
    partition=$(echo $line | awk -F " " '{ print $7f }')
    #echo "Partition: $partition Usage: $usage"
    if [ $usage -gt 5 ]; then
        echo "Partition: $partition Usage: $usage" | mutt -s "message" rakeshreddynarra07@gmail.com
    fi
done <<< $disk

