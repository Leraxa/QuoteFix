#!/bin/bash

if [ $# -ne 1 ]; then
    echo "No vaild argument was given."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File does not exist."
    exit 1
fi

while IFS= read -r line; do
    modified_line=$(echo "$line" | sed -E 's/(^| )"(.*?)"( |$)/\1„\2“\3/g')

    echo "$line"
    echo "$modified_line"
done < "$1"