#!/bin/bash

number=$1

if [ $number -gt 100 ]; then
    echo "$number is greater than 100"
else
    echo "$number is less than or equal to 100"
fi