#!/bin/bash 

count=10
# Method 1
# if [ $count -lt 9 ]
# then
#     echo "The condition is true"
# else
#     echo "The condition is false"
# fi
# Method 2
if (( $count < 9 ))
then
    echo "First condition is true"
elif (( $count > 9 ))
then
    echo "Second condition is true"
else
    echo "The condition is false"
fi

# Logical Conditional Statement
age=30
# Method 1
# if [ $age -gt 18 ] && [ $age -lt 40 ]
# then
#     echo "Age is correct"
# else
#     echo "Age is not correct"
# fi
# Method 2
if [ $age -gt 18 -a $age -lt 40 ]
then
    echo "Age is correct"
else
    echo "Age is not correct"
fi