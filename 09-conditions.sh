#!/bin/bash

NUM=$1

# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal

if [ $NUM -gt 20 ]; then
    echo "given num: $NUM is greater than 20"
elif [ $NUM -eq 20 ]; then
    echo "given num: $NUM is equal to 20"
else
    echo "given num: $NUM is less than 20"
fi