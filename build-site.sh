#!/usr/bin/env bash

# Remove the dist directory if it exists
rm -rf ./dist

# Create the dist directory
mkdir -p ./dist

# Concatenate all files in ./content recursively and pipe to pandoc
# find ./content -type f -print0 | \
#   awk -v RS='\0' '{
#     depth = gsub(/\//, "/", $0);
#     print depth "\t" $0;
#   }' | \
#   sort -n -k1,1 -k2 | \
#   cut -f2- | \
#   tr '\n' '\0' | \
#   xargs -0 cat | pandoc -o ./dist/index.html

# Temporary file to hold concatenated content
tempfile=$(mktemp)

# Generate sorted list of files by depth and alphabetical order
mapfile -d '' files < <(
  find ./content -type f -print0 | \
  awk -v RS='\0' '{
    depth = gsub(/\//, "/", $0);
    print depth "\t" $0;
  }' | \
  sort -n -k1,1 -k2 | \
  cut -f2- | \
  tr '\n' '\0'
)

# Append each file's content followed by two new lines
for file in "${files[@]}"; do
  cat "$file" >> "$tempfile"
  printf "\n\n" >> "$tempfile"
done

# Convert to HTML with pandoc
pandoc "$tempfile" -f markdown -o ./dist/index.html

# Clean up
rm "$tempfile"

