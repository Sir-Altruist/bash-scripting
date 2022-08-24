#!/bin/bash

name=('Segun' 'Tunji' 'Adeola' 'Abiodun' 'Bose' 'Nike')
echo "${name[@]}"
# To show indexes
echo "${!name[@]}"
# To show the length of the array
echo "${#name[@]}"
# To remove an element of an array
unset name[2]
echo "${name[@]}"
# To add an element of an array
name[2]="Mary"
echo "${name[@]}"