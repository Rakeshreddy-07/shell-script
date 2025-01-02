#!/bin/bash

a=$1
b=$2
timestamp=$(date +%m/%d/%y-%H:%M:%S)


c=$(( $a + $b ))

echo "script executed at $timestamp"
echo "Sum of a and b is: $c"
