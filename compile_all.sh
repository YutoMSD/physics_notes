#!/bin/bash

target_dir="."
original_dir=$(pwd)
find "$target_dir" -type f -name "main.tex" | while read -r filename; do
    file_dir=$(dirname "$filename")
    cd "$file_dir" || { echo "Failed to change directory to $file_dir"; exit 1; }
    echo "Processing file: $(basename "$filename") in directory: $file_dir"
    lualatex "$(basename "$filename")"
    lualatex "$(basename "$filename")"
    echo "Finished processing file: $(basename "$filename") in directory: $file_dir"
    cd "$original_dir" || { echo "Failed to return to the original directory"; exit 1; }
done
echo "Finished processing all .tex files."
