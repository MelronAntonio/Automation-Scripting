#!/bin/bash
# ping_list.sh
# Description: Reads a list of computers from computers.txt and pings each, logging results

INPUT_FILE="computers.txt"
LOG_FILE="ping_results.txt"

echo "Ping results for $(date)" > $LOG_FILE

while IFS= read -r host; do
    if ping -c 4 $host &> /dev/null; then
        echo "$host is reachable" >> $LOG_FILE
    else
        echo "$host is not reachable" >> $LOG_FILE
    fi
done < $INPUT_FILE

echo "Ping check completed. Results saved in $LOG_FILE"
