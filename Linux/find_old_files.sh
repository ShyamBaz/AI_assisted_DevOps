#!/bin/bash


# Usage: ./find_old_files.sh <dir1> <dir2> ... <dirN>
# This script finds .log and .feed files older than 6 months in the specified directories.

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <directory1> [directory2 ... directoryN]"
    exit 1
fi


# Prepare output files
log_output="old_log_files.txt"
feed_output="old_feed_files.txt"
> "$log_output"
> "$feed_output"

for dir in "$@"; do
    if [ ! -d "$dir" ]; then
        echo "Error: $dir is not a valid directory."
        continue
    fi
    echo "Searching in: $dir"
    find "$dir" -name "*.log" -type f -mtime +180 >> "$log_output"
    find "$dir" -name "*.feed" -type f -mtime +180 >> "$feed_output"
done

# Count and display results
log_count=$(wc -l < "$log_output")
feed_count=$(wc -l < "$feed_output")
echo "Total .log files older than 6 months: $log_count (see $log_output)"
echo "Total .feed files older than 6 months: $feed_count (see $feed_output)"
