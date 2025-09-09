# Linux Scripts for AI_assisted_DevOps

This folder contains shell scripts for DevOps automation and system health checks on Linux machines.

## Scripts

### server_health_check.sh
Analyzes the health of a Linux machine based on CPU, memory, and disk space usage.

**Health Status Logic:**
- Healthy: All parameters < 60%
- Warning: Any parameter between 60% and 80%
- Not Healthy: Any parameter > 80%

**Usage:**
```bash
bash server_health_check.sh [explain]
```
Add `explain` to get reasons for the health status.

---

### find_old_files.sh
Finds `.log` and `.feed` files older than 6 months in one or more directories.

**Features:**
- Accepts multiple directory arguments.
- Outputs results to `old_log_files.txt` and `old_feed_files.txt`.
- Displays total number of log and feed files found.

**Usage:**
```bash
bash find_old_files.sh /dir1 /dir2 ... /dirN
```
Check the output files for details.

---

### file_comparison.sh
Compares two files of any format and displays only the differing lines with their line numbers.

**Usage:**
```bash
bash file_comparison.sh <file1> <file2>
```
Displays differences between the files, showing the line number and content from each file where they differ.
