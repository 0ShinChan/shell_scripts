#!/bin/bash

# Function to display file permissions
display_permissions() {
    local file="$1"
    echo "Current permissions for $file:"
    ls -l "$file"
}

# Function to change file permissions
change_permissions() {
    local file="$1"
    local user="$2"
    local mode="$3"

    case "$user" in
        owner)
            chmod u="$mode" "$file"
            ;;
        group)
            chmod g="$mode" "$file"
            ;;
        others)
            chmod o="$mode" "$file"
            ;;
        all)
            chmod a="$mode" "$file"
            ;;
        *)
            echo "Invalid user type. Use: owner, group, others, or all"
            exit 1
            ;;
    esac
}

# Check if file is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file_path> [user_type] [permission_mode]"
    exit 1
fi

file="$1"

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file does not exist"
    exit 1
fi

# Display initial permissions
display_permissions "$file"

# If user and mode are provided, change permissions
if [ $# -eq 3 ]; then
    change_permissions "$file" "$2" "$3"
    echo "Updated permissions:"
    display_permissions "$file"
fi
