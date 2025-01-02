#!/bin/bash

number1=$1
numbre2=$2

if [ $number1 -gt $numbre2 ]; then
    echo "$number1 is greater than $numbre2"
else
    echo "$number1 is less than or equal to $numbre2"
fi