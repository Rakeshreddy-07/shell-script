#!/bin/bash

#USAGE=$(df -hT | grep -i xfs | awk -F " " {print $Nf})

#echo $USAGE

disk=$(df -hT | grep xfs)
threshold=5
MSG=""


while read -r line
do
    usage=$(echo $line | awk -F " " '{ print $6f }' | cut -d "%" -f 1)
    partition=$(echo $line | awk -F " " '{ print $7f }')
    #echo "Partition: $partition Usage: $usage"
    if [ $usage -gt $threshold ]; then
        MSG+="High Disk usage on Partition: $partition Usage: $usage \n"
    fi
done <<< $disk

echo -e "$MSG" | mutt -s "message" rakeshreddynarra07@gmail.com