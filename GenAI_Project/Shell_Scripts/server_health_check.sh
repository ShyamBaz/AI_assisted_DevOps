#!/bin/bash

# Health thresholds
HEALTHY_THRESHOLD=60
WARNING_THRESHOLD=80

explain=false
if [[ "$1" == "explain" ]]; then
    explain=true
fi

# Get CPU usage (average over 1 minute)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_percent=$(echo "100 - $cpu_usage" | bc)

# Get Memory usage
mem_total=$(free | grep Mem | awk '{print $2}')
mem_used=$(free | grep Mem | awk '{print $3}')
mem_percent=$(echo "($mem_used/$mem_total)*100" | bc -l)
mem_percent=$(printf "%.0f" $mem_percent)

# Get Disk usage (root partition)
disk_percent=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

status="Healthy"
reason=""

# Check thresholds
if (( $(echo "$cpu_percent > $WARNING_THRESHOLD" | bc -l) )) || \
   (( $mem_percent > $WARNING_THRESHOLD )) || \
   (( $disk_percent > $WARNING_THRESHOLD )); then
    status="Not Healthy"
    if $explain; then
        reason="Reason(s): "
        if (( $(echo "$cpu_percent > $WARNING_THRESHOLD" | bc -l) )); then
            reason+="CPU usage is high ($cpu_percent%). "
        fi
        if (( $mem_percent > $WARNING_THRESHOLD )); then
            reason+="Memory usage is high ($mem_percent%). "
        fi
        if (( $disk_percent > $WARNING_THRESHOLD )); then
            reason+="Disk usage is high ($disk_percent%). "
        fi
    fi
elif (( $(echo "$cpu_percent > $HEALTHY_THRESHOLD" | bc -l) )) || \
     (( $mem_percent > $HEALTHY_THRESHOLD )) || \
     (( $disk_percent > $HEALTHY_THRESHOLD )); then
    status="Warning"
    if $explain; then
        reason="Reason(s): "
        if (( $(echo "$cpu_percent > $HEALTHY_THRESHOLD" | bc -l) )) && (( $(echo "$cpu_percent <= $WARNING_THRESHOLD" | bc -l) )); then
            reason+="CPU usage is moderate ($cpu_percent%). "
        fi
        if (( $mem_percent > $HEALTHY_THRESHOLD )) && (( $mem_percent <= $WARNING_THRESHOLD )); then
            reason+="Memory usage is moderate ($mem_percent%). "
        fi
        if (( $disk_percent > $HEALTHY_THRESHOLD )) && (( $disk_percent <= $WARNING_THRESHOLD )); then
            reason+="Disk usage is moderate ($disk_percent%). "
        fi
    fi
else
    status="Healthy"
    if $explain; then
        reason="All parameters are within healthy limits."
    fi
fi

echo "Health Status: $status"
if $explain; then
    echo "$reason"
fi
