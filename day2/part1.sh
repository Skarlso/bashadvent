#!/bin/bash

declare total

while IFS='' read -r line || [[ -n "$line" ]]; do
    IFS='x' read -ra split <<< "$line"
    l=${split[0]}
    w=${split[1]}
    h=${split[2]}

    (( total+=(2*l*w)+(2*w*h)+(2*l*h) ))
    # IFS -> Tell it to delimit with new line which sort requires.
    # -n -> numbers
    # <<< -> Input stream
    IFS=$'\n' sorted=($(sort -n <<<"${split[*]}"))
    (( total+=sorted[0]*sorted[1] ))
    unset IFS
done < "input.txt"

echo $total
