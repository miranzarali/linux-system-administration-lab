#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <service-name>"
    exit 2
fi

SERVICE="$1"

if ! systemctl list-unit-files "${SERVICE}.service" --no-legend |
    grep -q .; then
    echo "[ERROR] Service unit not found: $SERVICE"
    exit 2
fi

if systemctl is-active --quiet "$SERVICE"; then
    echo "[OK] $SERVICE is running"
    exit 0
else
    echo "[WARNING] $SERVICE is not running"
    exit 1
fi
