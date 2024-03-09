#!/bin/bash

# Generate timestamp in the format: YYYY_MM_DD_HH-MM-SS

timestamp=$(date '+%Y_%m_%d_%H-%M-%S')

# Assign source directory from the first argument

source_directory="$1"

# Assign destination directory from the second argument

destination_directory="$2"

# Construct the backup filename using the timestamp

backup_directory="${destination_directory}/${timestamp}.tar.gz"

# Check if source directory exists

if [ ! -d "$source_directory" ]; then
    echo "Source directory '$source_directory' does not exist."
fi

# Create the destination directory if it doesn't exist

mkdir -p "$destination_directory"

# Create the tar archive of the source directory and save it in the destination directory

sudo tar -czf "$backup_directory" "$source_directory"

# Print the path to the backup directory

echo "Backup created: $backup_directory"
