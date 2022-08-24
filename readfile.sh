#!/bin/bash

# Static File Reading
# while read file
# do
#     echo $file
# done < tut.txt

# Dynamic File Reading
while read file
do 
    echo $file
done < "${1:-/dev/stdin}"