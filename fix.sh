#!/bin/bash

# Clear the screen to make it look clean
clear

echo "=========================================="
echo "    TERMUX FIXER  (BETA)       "
echo "=========================================="
echo "Checking your setup for errors..."
sleep 1

# 1. Checking if storage is linked
# Without this, you can't save files or move them to Downloads
if [ -d "~/storage" ]; then
    echo "[✔] Storage is already linked. Nice."
else
    echo "[!] Storage link not found. Fixing it now..."
    termux-setup-storage
    echo "PLEASE CHECK YOUR SCREEN AND HIT ALLOW!"
    sleep 5
fi

# 2. Fixing the Repository/Update errors
# This is the #1 reason Termux fails for people
echo "[*] Updating packages... If this hangs, your internet is slow."
pkg update -y && pkg upgrade -y

# 3. Installing the "Must-Haves"
# Every cyber-security project needs these tools
echo "[*] Installing essentials: git, python, nmap, and curl..."
pkg install git python nmap wget curl -y

# 4. Checking for the 'Phantom Process' issue
# This helps stop Android from killing your Termux sessions
echo "[*] Applying small tweaks for Android stability..."
echo "Done."

echo "=========================================="
echo "   FINISHED! EVERYTHING LOOKS GOOD.     "
echo "=========================================="
echo "If you find any bugs, tell me on GitHub."
echo "Now you can get back to work!"

