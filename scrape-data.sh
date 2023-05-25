#!/bin/bash

# Check if the js.txt file argument is provided
if [ -z "$1" ]; then
    echo "Please provide the path to the js.txt file as an argument."
    exit 1
fi

# Get the directory path of the js.txt file
js_directory=$(dirname "$1")

# Create the data directory if it doesn't exist
mkdir -p "$js_directory/data"

# Read the js.txt file line by line
while IFS= read -r url
do
    # Extract the file name from the URL
    file_name=$(basename "$url")

    # Download the JS file and save it to the data directory
    curl "$url" -o "$js_directory/data/$file_name"

    # Optionally, you can print the progress for each file
    echo "Downloaded: $file_name"
done < "$1"
