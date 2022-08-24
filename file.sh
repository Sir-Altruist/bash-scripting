#!/bin/bash

# echo "Enter directory name"
# read directory
# if [ -d $directory ]
# then
#     echo "$directory exists"
# else
#     echo "$directory does not exist"
# fi

# To create a file
# echo "Enter file name"
# read fileName

# touch $fileName

# Append text into a file
echo "Enter filename"
read fileName

if [[ -f $fileName ]]
then
    echo "Enter texts"
    read fileText
    echo $fileText >> $fileName
else
    echo "$fileName does not exist"
    echo "Enter a file name to create a new file"
    read newFileName
    echo "Enter texts"
    touch $newFileName
    read newFileText
    echo $newFileText >> $newFileName
    echo "File created and text appended"
fi