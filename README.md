
# AI_assisted_DevOps

## Linux Scripts

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

---

### file_comparison.sh
Compares two files of any format and displays only the differing lines with their line numbers.

**Usage:**
```bash
bash file_comparison.sh <file1> <file2>
```

---

## Python Scripts

### server_health_check.py
Analyzes the health of a Linux machine based on CPU, memory, and disk space usage using Python and psutil.

**Health Status Logic:**
- Healthy: All parameters < 60%
- Warning: Any parameter between 60% and 80%
- Not Healthy: Any parameter > 80%

**Usage:**
```bash
python server_health_check.py [--explain]
```
Add `--explain` to get reasons for the health status.

---

### find_old_files.py
Finds `.log` and `.feed` files older than 6 months in one or more directories using Python.

**Features:**
- Accepts multiple directory arguments.
- Outputs results to `old_log_files.txt` and `old_feed_files.txt`.
- Displays total number of log and feed files found.

**Usage:**
```bash
python find_old_files.py /folder1 /folder2 ... /folderN
```
Check the output files for details.

---

### file_comparison.py
Compares two files of any format and displays only the differing lines with their line numbers using Python.

**Usage:**
```bash
python file_comparison.py file1.txt file2.txt
```

---

### calculator.py
Performs basic arithmetic operations (add, subtract, multiply, divide) on any number of inputs provided via command line arguments.

**Usage:**
```bash
python calculator.py add 1 2 3 4
python calculator.py subtract 10 2 3
python calculator.py multiply 2 3 4
python calculator.py divide 20 2 2
```
Choose the operation and pass as many numbers as needed.
