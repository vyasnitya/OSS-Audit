#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Nitya Vyas | Course: Open Source Software

PACKAGE="git"

echo "========================================"
echo "      FOSS Package Inspector: Git"
echo "========================================"

# Check if package is installed by querying dpkg or rpm depending on distro
if command -v dpkg &> /dev/null; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "$PACKAGE is installed."
        dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "Version: " $3}'
    else
        echo "$PACKAGE is NOT installed on this Debian/Ubuntu system."
    fi
elif command -v rpm &> /dev/null; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE is installed."
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed on this RPM system."
    fi
elif command -v "$PACKAGE" &>/dev/null; then
    # Fallback to binary check if not on a standard deb/rpm system
    echo "$PACKAGE is installed (binary found in PATH)."
    "$PACKAGE" --version
else
    echo "$PACKAGE is NOT installed."
fi

echo "----------------------------------------"

# A case statement to output a one-line philosophy note about various FOSS packages
case "$PACKAGE" in
    httpd|apache2) 
        echo "Apache: the web server that built the open internet" 
        ;;
    mysql|mariadb) 
        echo "MySQL/MariaDB: open source at the heart of millions of apps" 
        ;;
    git) 
        echo "Git: the decentralized fabric that prevents corporate lock-in and powers GitHub." 
        ;;
    vlc)
        echo "VLC: built by university students in Paris, now plays any imaginable media format."
        ;;
    python3|python)
        echo "Python: a powerful, accessible language shaped entirely by community contribution."
        ;;
    curl)
        echo "cURL: the universal data transfer tool holding the Internet together."
        ;;
    *)
        echo "A valuable contribution to the massive FOSS ecosystem."
        ;;
esac
echo "========================================"
