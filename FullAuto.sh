#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

(crontab -l 2>/dev/null; echo "@reboot $SCRIPT_DIR/SdrPart2.sh") | crontab -

sudo "$SCRIPT_DIR/SdrPart1.sh"
