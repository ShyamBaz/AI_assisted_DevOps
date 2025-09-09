import os
import argparse
import time
from pathlib import Path

SIX_MONTHS = 180 * 24 * 60 * 60  # seconds

def find_old_files(directories):
    now = time.time()
    log_files = []
    feed_files = []
    for directory in directories:
        if not os.path.isdir(directory):
            print(f"Error: {directory} is not a valid directory.")
            continue
        for root, _, files in os.walk(directory):
            for file in files:
                if file.endswith('.log') or file.endswith('.feed'):
                    file_path = os.path.join(root, file)
                    if now - os.path.getmtime(file_path) > SIX_MONTHS:
                        if file.endswith('.log'):
                            log_files.append(file_path)
                        elif file.endswith('.feed'):
                            feed_files.append(file_path)
    return log_files, feed_files

def write_to_file(file_list, filename):
    with open(filename, 'w') as f:
        for file in file_list:
            f.write(file + '\n')

def main():
    parser = argparse.ArgumentParser(description="Find .log and .feed files older than 6 months.")
    parser.add_argument('folders', nargs='+', help='Folders to search')
    args = parser.parse_args()

    log_files, feed_files = find_old_files(args.folders)
    write_to_file(log_files, 'old_log_files.txt')
    write_to_file(feed_files, 'old_feed_files.txt')

    print(f"Total .log files older than 6 months: {len(log_files)} (see old_log_files.txt)")
    print(f"Total .feed files older than 6 months: {len(feed_files)} (see old_feed_files.txt)")

if __name__ == "__main__":
    main()
