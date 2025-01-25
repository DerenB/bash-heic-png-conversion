#!/bin/bash

# Directory containing the files
input_dir="/Users/deren/Documents/Z_Convert/"

pngString=".png"

# Check if the directory exists
if [ ! -d "$input_dir" ]; then
  echo "Error: Directory $input_dir does not exist."
  exit 1
fi

# Loop through all files in the directory
for file in "$input_dir"/*; do

  # Check if the item is a file (not a directory)
  if [ -f "$file" ]; then
    # Get Base file Name
    base_name=$(basename "$file")

    # Set heic name
    heic_name="$input_dir/${base_name}"

    # Set PNG name
    file_name="${base_name%.*}"
    png_name="$input_dir/$file_name$pngString"

    magick "$heic_name" "$png_name"
  fi
done

echo "Processing complete!"