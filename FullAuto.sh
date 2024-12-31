#!/bin/bash

LOG_FILE="/home/andrew/Documents/VersionControl/bladerf-startup/startup.log"
exec > >(tee -a "$LOG_FILE") 2>&1

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#remove any previous calls from crontab
crontab -l | grep -v 'SdrPart2' | crontab -
#add the call
(crontab -l 2>/dev/null; echo "@reboot $SCRIPT_DIR/SdrPart2.sh") | crontab -

sudo "$SCRIPT_DIR/SdrPart1.sh"
