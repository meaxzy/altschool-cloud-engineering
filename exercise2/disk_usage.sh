#!/bin/bash

# Check if the first argument is '-d' for displaying all files.

if [[ $1 == '-d' ]]; then
    list_dirs_files=true
    shift 1 # Shift the arguments to remove the '-d'.
fi

# Check if the first argument is '-n' and the second argument is a number.
if [[ $1 == '-n' && $2 =~ ^[0-9]+$ ]]; then  
    entries=$2
    shift 2  # Shift the arguments to remove '-n' and the number.
else
    entries=8  # Default number of entries to display.
fi

# Store the directory path.

directory=$1

# Check if we should display all files or just top-level directory.

if [[ $list_dirs_files = true ]]; then
    # Display all files recursively and sort them by size, then display the top entries.
    
    sudo du -h $directory/* | sort -rh | head -n $entries
else
    # Display only top-level directory sizes and sort them by size, then display the top entries.
    
    sudo du -h --max-depth=1 $directory | sort -rh | head -n $entries
fi
