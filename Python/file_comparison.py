import argparse


def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        lines1 = f1.readlines()
        lines2 = f2.readlines()

    max_len = max(len(lines1), len(lines2))
    for i in range(max_len):
        line1 = lines1[i].rstrip('\n') if i < len(lines1) else ''
        line2 = lines2[i].rstrip('\n') if i < len(lines2) else ''
        if line1 != line2:
            print(f"Line {i+1}:")
            print(f"  File1: {line1}")
            print(f"  File2: {line2}")


def main():
    parser = argparse.ArgumentParser(description="Compare two files and display differences with line numbers.")
    parser.add_argument('file1', help='First file to compare')
    parser.add_argument('file2', help='Second file to compare')
    args = parser.parse_args()

    compare_files(args.file1, args.file2)


if __name__ == "__main__":
    main()
