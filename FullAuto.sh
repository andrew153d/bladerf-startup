#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/startup.log"
PASSWORD="cyberdeck"

exec > >(tee -a "$LOG_FILE") 2>&1

# Remove any previous calls from crontab
crontab -l | grep -v 'SdrPart2' | crontab -

# Add the call
(crontab -l 2>/dev/null; echo "@reboot echo \"$PASSWORD\" | sudo -S $SCRIPT_DIR/SdrPart2.sh >> \"$LOG_FILE\" 2>&1") | crontab -

echo "$PASSWORD" | sudo -S "$SCRIPT_DIR/SdrPart1.sh" >> "$LOG_FILE" 2>&1
