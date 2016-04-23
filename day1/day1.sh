#!/bin/bash

value=$(<input.txt)

counter=0
for (( i=0; i<${#value}; i++ )); do
    if [ "${value:$i:1}" == "(" ]; then
        (( counter++ ))
    else
        (( counter-- ))
    fi
done

echo $counter
