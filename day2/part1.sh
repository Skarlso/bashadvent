#!/bin/bash

declare -a arr

while IFS='' read -r line || [[ -n "$line" ]]; do
    arr+=($line)
done < "input.txt"

echo "${arr[@]}"
