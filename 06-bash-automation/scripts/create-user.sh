#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <username> <group>"
    exit 2
fi

USERNAME="$1"
GROUP="$2"

if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] Run this script with sudo."
    exit 1
fi

if [[ ! "$USERNAME" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
    echo "[ERROR] Invalid username format."
    exit 2
fi

if ! getent group "$GROUP" >/dev/null; then
    echo "[ERROR] Group does not exist: $GROUP"
    exit 2
fi

if id "$USERNAME" >/dev/null 2>&1; then
    echo "[ERROR] User already exists: $USERNAME"
    exit 1
fi

if useradd -m -s /bin/bash -g "$GROUP" "$USERNAME"; then
    echo "[OK] Created user '$USERNAME' with primary group '$GROUP'."
else
    echo "[ERROR] User creation failed."
    exit 1
fi
