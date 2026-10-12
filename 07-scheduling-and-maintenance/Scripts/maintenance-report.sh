#!/usr/bin/env bash

set -u

LOG_DIR="$HOME/maintenance-lab/logs"
LOG_FILE="$LOG_DIR/maintenance.log"

mkdir -p "$LOG_DIR" || exit 1

{
    echo "========================================"
    echo "Linux Maintenance Report"
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo "========================================"

    echo
    echo "===== Disk Usage ====="
    df -h /

    echo
    echo "===== Memory Usage ====="
    free -h

    echo
    echo "===== System Uptime ====="
    uptime

    echo
    echo "===== Failed Systemd Services ====="
    systemctl --failed --no-pager

    echo
} >> "$LOG_FILE" 2>&1

echo "[OK] Maintenance report appended to: $LOG_FILE"
