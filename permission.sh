#!/bin/bash

# Check if no arguments provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

# Process each argument
for arg in "$@"
do
    # Check if argument exists
    if [ ! -e "$arg" ]; then
        echo "Error: $arg does not exist"
        continue
    fi

    # Check if it's a directory
    if [ -d "$arg" ]; then
        echo "[$arg] is a DIRECTORY"
        continue
    fi

    # If it's a file
    if [ -f "$arg" ]; then
        # Count lines and words
        lines=$(wc -l < "$arg")
        words=$(wc -w < "$arg")

        # Print file details
        echo "File: $arg"
        echo "Lines: $lines"
        echo "Words: $words"

        # Check group permissions
        current_perms=$(ls -l "$arg" | cut -d' ' -f1)
        group_write=$(echo "$current_perms" | grep -q "w" && echo "yes" || echo "no")

        # Toggle group write permission
        if [ "$group_write" == "no" ]; then
            chmod g+w "$arg"
            echo "Added group write permission"
        else
            chmod g-w "$arg"
            echo "Removed group write permission"
        fi

        echo "---"
    fi
done
