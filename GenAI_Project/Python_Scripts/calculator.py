import argparse
import sys


def add(numbers):
    return sum(numbers)

def subtract(numbers):
    result = numbers[0]
    for num in numbers[1:]:
        result -= num
    return result

def multiply(numbers):
    result = 1
    for num in numbers:
        result *= num
    return result

def divide(numbers):
    result = numbers[0]
    for num in numbers[1:]:
        if num == 0:
            print("Error: Division by zero.")
            sys.exit(1)
        result /= num
    return result

def main():
    parser = argparse.ArgumentParser(description="Calculator supporting n number of inputs.")
    parser.add_argument('operation', choices=['add', 'subtract', 'multiply', 'divide'], help='Operation to perform')
    parser.add_argument('numbers', nargs='+', type=float, help='Numbers to calculate')
    args = parser.parse_args()

    if args.operation == 'add':
        print(f"Result: {add(args.numbers)}")
    elif args.operation == 'subtract':
        print(f"Result: {subtract(args.numbers)}")
    elif args.operation == 'multiply':
        print(f"Result: {multiply(args.numbers)}")
    elif args.operation == 'divide':
        print(f"Result: {divide(args.numbers)}")

if __name__ == "__main__":
    main()
