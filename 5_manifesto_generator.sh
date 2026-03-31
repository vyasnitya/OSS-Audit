#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Nitya Vyas | Course: Open Source Software
# Generates a personalized open source philosophy statement.

echo "=================================================="
echo "          FOSS Manifesto Generator v1.0"
echo "=================================================="
echo "Answer three questions to generate your manifesto."
echo ""

# We use the read command to parse user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Fetch the current month-day strings
DATE=$(date '+%d %B %Y')

# A variable utilizing subshell command dynamically identifying user
OUTPUT="manifesto_$(whoami).txt"

echo "=================================================="
echo "        Composing your personal philosophy..."

# Concatenate inputs into a coherent philosophy statement
echo "Open Source Declaration" > "$OUTPUT"
echo "Generated on $DATE by $(whoami)" >> "$OUTPUT"
echo "-------------------------------------" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every tool we rely on was shaped by people who chose to build honestly and share their work freely with the world. I depend on $TOOL entirely to operate effectively. In a digital world, true software liberty is equivalent to $FREEDOM." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Code is knowledge, and locking away knowledge stifles modern innovation. If I possessed the resources and the time right now, I would absolutely architect $BUILD and open its repository, ensuring my contributions empower another student just as Linus Torvalds empowered me." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Display a completion confirmation
echo "Manifesto beautifully forged and saved strictly to $OUTPUT"
echo "--------------------------------------------------"

# Print out the output to the terminal interface
cat "$OUTPUT"
echo "=================================================="
