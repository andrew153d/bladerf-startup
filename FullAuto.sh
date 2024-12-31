#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/startup.log"
PASSWORD="$1"

# Verify the password by running a sudo command
echo "$PASSWORD" | sudo -S ls /root > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Invalid password or sudo configuration. Exiting."
    exit 1
fi

#exec > >(tee -a "$LOG_FILE") 2>&1

# Remove any previous calls from crontab
crontab -l | grep -v 'SdrPart2' | crontab -

# Add the call
(crontab -l 2>/dev/null; echo "@reboot echo \"$PASSWORD\" | sudo -S $SCRIPT_DIR/SdrPart2.sh >> \"$LOG_FILE\" 2>&1") | crontab -

echo "$PASSWORD" | sudo -S "$SCRIPT_DIR/SdrPart1.sh" >> "$LOG_FILE" 2>&1
