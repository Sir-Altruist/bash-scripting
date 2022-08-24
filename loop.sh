#!/bin/bash
# while loop: This will continue to run until the condition is true
# number=1
# while [ $number -le 10 ]
# do
#     echo $number
#     number=$(( number+1 ))
# done

# until loop: This will coninue to run until the condition is false
# age=1
# until [ $age -gt 10 ]
# do
#     echo $age
#     age=$(( age+1 ))
# done

# for loop
# Method 1
# for i in 1 2 3 4 5
# do
#     echo $i
# done
# Method 2
# for i in {0..20..2}
# do
#     echo $i
# done
# Method 3
# for (( i=1; i<=10; i++ ))
# do
#     if [ $i -gt 5 ]
#     then
#         break
#     fi
#     echo $i
# done
# for (( i=1; i<10; i++ ))
# do
#     if [ $i -eq 3 ] || [ $i -eq 7 ]
#     then
#         continue
#     fi
#     echo $i
# done

# Select loop
# select car in BMW MERCEDES HONDA TESLA TOYOTA
# do
#     echo "You have selected ${car}"
# done
# Select loop with case statement
select car in BMW MERCEDES HONDA TESLA TOYOTA
do
    case $car in 
    BMW)
        echo "BMW selected";;
    MERCEDES)
        echo "MERCEDES selected";;
    HONDA)
        echo "HONDA selected";;
    TESLA)
        echo "TESLA selected";;
    TOYOTA)
        echo "TOYOTA selected";;
    *)
        echo "Error! Option selected is not available";;
    esac
done
