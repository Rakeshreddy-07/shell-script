#!/bin/bash

a=$1
b=$2
timestamp=$(date +%H:%M:%S)


c=$(( $a + $b ))

echo "script executed at $timestamp"
echo "Value a plus value b is: $c"
