import psutil
import argparse

HEALTHY_THRESHOLD = 60
WARNING_THRESHOLD = 80

def get_cpu_percent():
    return psutil.cpu_percent(interval=1)

def get_memory_percent():
    return psutil.virtual_memory().percent

def get_disk_percent():
    return psutil.disk_usage('/').percent

def analyze_health(cpu, mem, disk):
    status = "Healthy"
    reasons = []
    if cpu > WARNING_THRESHOLD or mem > WARNING_THRESHOLD or disk > WARNING_THRESHOLD:
        status = "Not Healthy"
        if cpu > WARNING_THRESHOLD:
            reasons.append(f"CPU usage is high ({cpu}%)")
        if mem > WARNING_THRESHOLD:
            reasons.append(f"Memory usage is high ({mem}%)")
        if disk > WARNING_THRESHOLD:
            reasons.append(f"Disk usage is high ({disk}%)")
    elif cpu > HEALTHY_THRESHOLD or mem > HEALTHY_THRESHOLD or disk > HEALTHY_THRESHOLD:
        status = "Warning"
        if HEALTHY_THRESHOLD < cpu <= WARNING_THRESHOLD:
            reasons.append(f"CPU usage is moderate ({cpu}%)")
        if HEALTHY_THRESHOLD < mem <= WARNING_THRESHOLD:
            reasons.append(f"Memory usage is moderate ({mem}%)")
        if HEALTHY_THRESHOLD < disk <= WARNING_THRESHOLD:
            reasons.append(f"Disk usage is moderate ({disk}%)")
    else:
        status = "Healthy"
        reasons.append("All parameters are within healthy limits.")
    return status, reasons

def main():
    parser = argparse.ArgumentParser(description="Analyze Linux machine health.")
    parser.add_argument("--explain", action="store_true", help="Explain the reason for health status.")
    args = parser.parse_args()

    cpu = get_cpu_percent()
    mem = get_memory_percent()
    disk = get_disk_percent()

    status, reasons = analyze_health(cpu, mem, disk)
    print(f"Health Status: {status}")
    if args.explain:
        print("Reason(s):")
        for reason in reasons:
            print(f"- {reason}")

if __name__ == "__main__":
    main()
