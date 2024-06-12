#!/bin/bash

# Check if a filename was provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <wordlist>"
    exit 1
fi

# Check if the provided filename exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file line by line
while IFS= read -r line
do
    # Print only the SHA256 hash of the word
    echo -n "$line" | sha256sum | awk '{print $1}'
done < "$1"
