#!/bin/bash

value=$(<input.txt)

counter=0
for (( i=0; i<${#value}; i++ )); do
    if [ "${value:$i:1}" == "(" ]; then
        (( counter++ ))
    else
        (( counter-- ))
    fi

    if [[ $counter == -1 ]]; then
        # Because we want the position which starts of at 0 we need a +1.
        echo "$(( i+1 ))"
        exit 0
    fi
done

echo $counter
