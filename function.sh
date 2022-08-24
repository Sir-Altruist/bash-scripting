#!/bin/bash

function funcName()
{
    echo "This is a function"
}
funcName

# A function with an argument
function funcArg()
{
    echo $1 $2
}
funcArg "This is a function with an argument" "I'm just learning about it"

# A function with a local variable
function check()
{
    val="This is a function with a local variable"
    echo $val
}
check
# Variable Scoping
function scoping()
{
    # Local
    res='I love linux'
}
# Global
res="I love Mac"
echo $res
# You can only access a function variable externally after the function has been called
scoping
echo $res


