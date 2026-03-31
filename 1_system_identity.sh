#!/bin/bash
# Script 1: System Identity Report
# Author: Nitya Vyas | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Nitya Vyas"
SOFTWARE_CHOICE="Git"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date '+%A, %B %d, %Y - %T')

# Try to get distribution name securely
if [ -f /etc/os-release ]; then
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)
else
    DISTRO=$(uname -s)
fi

# Determine license message
if [[ "$DISTRO" == "Darwin" ]]; then
    LICENSE_MSG="macOS is proprietary, though its core (Darwin) is open-source (APSL)."
else
    LICENSE_MSG="The core Linux OS kernel is protected under the GNU General Public License version 2.0 (GPLv2)."
fi

# --- Display ---
echo "=================================================="
echo "         Open Source Audit — $STUDENT_NAME"
echo "=================================================="
echo "Software Target: $SOFTWARE_CHOICE"
echo "--------------------------------------------------"
echo "Distribution   : $DISTRO"
echo "Kernel Version : $KERNEL"
echo "--------------------------------------------------"
echo "User           : $USER_NAME"
echo "Home Directory : $HOME"
echo "--------------------------------------------------"
echo "Current Date   : $DATE"
echo "Uptime         : $UPTIME"
echo "--------------------------------------------------"
echo "OS License Note: $LICENSE_MSG"
echo "=================================================="
