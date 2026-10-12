#!/usr/bin/env bash

set -u

echo "===== Linux System Information ====="
echo "Date: $(date)"
echo

echo "Hostname: $(hostname)"
echo "Operating System: $(. /etc/os-release && echo "$PRETTY_NAME")"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo

echo "===== CPU ====="
lscpu | grep -E '^(Architecture|CPU\(s\)|Model name):'
echo

echo "===== Memory ====="
free -h
echo

echo "===== Root Filesystem ====="
df -h /
echo

echo "===== Network Interfaces ====="
ip -br addr

exit 0
