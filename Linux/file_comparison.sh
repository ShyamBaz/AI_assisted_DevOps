#!/bin/bash

# Usage: ./file_comparison.sh <file1> <file2>
# Compares two files and displays differences with line numbers.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

file1="$1"
file2="$2"

if [ ! -f "$file1" ]; then
    echo "Error: $file1 does not exist or is not a file."
    exit 1
fi
if [ ! -f "$file2" ]; then
    echo "Error: $file2 does not exist or is not a file."
    exit 1
fi

# Compare files and show differences with line numbers
# Only lines that differ are shown, with their line number in each file
awk 'NR==FNR{a[NR]=$0;next} {if ($0!=a[FNR]) print "File1 Line " FNR ": " a[FNR] "\nFile2 Line " FNR ": " $0 "\n"}' "$file1" "$file2"
