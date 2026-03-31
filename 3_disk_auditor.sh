#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Nitya Vyas | Course: Open Source Software

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=================================================="
echo "              Directory Audit Report"
echo "=================================================="

# Loop through important system directories
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract owner, group, and permissions using ls -ld and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Extract the disk usage space
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "$DIR => Permissions & Owner: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this environment."
    fi
done

echo "--------------------------------------------------"
echo "                 Git Diagnostics:"
echo "--------------------------------------------------"

# Check if the chosen software's config directories exist
CONFIG_DIR="$HOME/.git" # Simulating checking a standard config/repo context
GLOBAL_GIT_CONFIG="/etc/gitconfig"
USER_GIT_CONFIG="$HOME/.gitconfig"

# Test global system configuration
if [ -f "$GLOBAL_GIT_CONFIG" ]; then
    PERM=$(ls -ld "$GLOBAL_GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "Global configuration ($GLOBAL_GIT_CONFIG) exists: $PERM"
else
    echo "No global distribution-level Git config found at /etc/gitconfig"
fi

# Test user configuration
if [ -f "$USER_GIT_CONFIG" ]; then
    PERM=$(ls -ld "$USER_GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "User configuration ($USER_GIT_CONFIG) exists: $PERM"
else
    echo "No user-specific Git config found at ~/.gitconfig"
fi
echo "=================================================="
