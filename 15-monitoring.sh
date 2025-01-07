#!/bin/bash

#USAGE=$(df -hT | grep -i xfs | awk -F " " {print $Nf})

#echo $USAGE

disk=$(df -hT)

echo $disk