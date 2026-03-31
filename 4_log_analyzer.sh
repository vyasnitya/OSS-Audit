#!/bin/bash
# Script 4: Log File Analyzer
# Author: Nitya Vyas | Course: Open Source Software
# Usage: ./4_log_analyzer.sh /var/log/syslog

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

# Ensure that the user provides a log file path as the first argument
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 /path/to/logfile [keyword]"
    exit 1
fi

# Check if the file is reachable/exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found or inaccessible."
    # Retry mechanism for a non-existent file
    ATTEMPT=1
    while [ $ATTEMPT -le 3 ]; do
        read -p "Please enter a valid log file path: " LOGFILE
        if [ -f "$LOGFILE" ]; then
            echo "File found. Proceeding with analysis."
            break
        else
            echo "Attempt $ATTEMPT: Invalid path."
            ATTEMPT=$((ATTEMPT + 1))
        fi
    done
    
    # Exit if still invalid after retries
    if [ ! -f "$LOGFILE" ]; then
        echo "Exceeded retries. Aborting."
        exit 1
    fi
fi

# Read file line by line
while IFS= read -r LINE; do
    # Using grep in quiet mode inside an if-condition to find keyword
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "=================================================="
echo "               Log File Analysis Summary"
echo "=================================================="
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# Display a context snippet if any lines were matched
if [ "$COUNT" -gt 0 ]; then
    echo "--------------------------------------------------"
    echo "              Last 5 matching lines:"
    echo "--------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
else
    echo "No context to display, zero matches found for keyword."
fi
echo "=================================================="
