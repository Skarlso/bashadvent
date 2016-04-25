#!/bin/bash

declare total

while IFS='' read -r line || [[ -n "$line" ]]; do
    IFS='x' read -ra split <<< "$line"
    IFS=$'\n' sorted=($(sort -n <<<"${split[*]}"))
    unset IFS
    l=${sorted[0]}
    w=${sorted[1]}
    h=${sorted[2]}

    (( total+=(2*l)+(2*w) ))
    (( total+=l*w*h ))
done < "input.txt"

echo $total
