#!/bin/bash          
# STR="Hello World!"
# COUNT=10
# echo $STR
# if [ $COUNT -gt 11 ]
# then
#     echo $COUNT
# else
#     echo "Variable does not exist"
# fi

# echo "Enter a numner"
# read a

# echo "Enter another numner"
# read b

# var=$((a+b))
# echo $var

# read a
# read b

# if [ $a -gt $b ]
# then
# echo "A is greater than B"
# elif [ $a -lt $b ]
# then
# echo "B is greater than A"
# else
# echo "A is equal to B"
# fi

read a
read b
read c

if [ $a == $b -a $b == $c -a $a == $c ]
then
echo "This is an Equilateral triangle"
elif [ $a == $b -o $b == $c -o $a == $c ]
then
echo "This is Isosceles triangle"
else
echo "This is a Scalene triangle"
fi