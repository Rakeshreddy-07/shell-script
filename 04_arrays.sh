#!/bin/bash

movies=("pushpa" "rrr" "devara")

echo "first movie: $movies[$0]"
echo "second movie: $movies[$1]"
echo "third movie: $movies[$2]"

echo "All movies list: $movies[$@]"