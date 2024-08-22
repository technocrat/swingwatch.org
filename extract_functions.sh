#!/bin/bash

# Directory containing .jl files
directory="/Users/ro/projects/SwingWatch/_assets/scripts"

# Output file to store extracted lines
output_file="output_file.txt"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory does not exist: $directory"
  exit 1
fi

# Empty the output file if it already exists
> "$output_file"

# Function to extract lines from a file
extract_functions() {
  local file="$1"
  local in_function=0
  while IFS= read -r line; do
    if [[ $line =~ ^function ]]; then
      in_function=1
      echo "$line" >> "$output_file"
    elif [[ $in_function -eq 1 && $line =~ end$ ]]; then
      echo "$line" >> "$output_file"
      echo "" >> "$output_file"  # Add a newline for readability
      in_function=0
    elif [[ $in_function -eq 1 ]]; then
      echo "$line" >> "$output_file"
    fi
  done < "$file"
}

# Export the function to be available in subshells
export -f extract_functions

# Find .jl files and process each one
find "$directory" -type f -name '*.jl' -exec bash -c 'extract_functions "$0"' {} \;

echo "Extraction complete. Output stored in: $output_file"
