#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <source-directory> <destination-directory>"
    exit 2
fi

SOURCE="${1%/}"
DESTINATION="${2%/}"

if [[ ! -d "$SOURCE" ]]; then
    echo "[ERROR] Source directory does not exist: $SOURCE"
    exit 2
fi

if [[ -z "$DESTINATION" || "$SOURCE" == "$DESTINATION" ]]; then
    echo "[ERROR] Invalid destination directory."
    exit 2
fi

if [[ "$DESTINATION" == "$SOURCE/"* ]]; then
    echo "[ERROR] Destination must not be inside the source directory."
    exit 2
fi

if ! mkdir -p -- "$DESTINATION"; then
    echo "[ERROR] Cannot create destination directory."
    exit 1
fi

BACKUP_FILE="$DESTINATION/backup-$(basename "$SOURCE")-$(date +%Y%m%d-%H%M%S).tar.gz"

if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    echo "[OK] Backup created: $BACKUP_FILE"
    exit 0
else
    echo "[ERROR] Backup failed."
    rm -f -- "$BACKUP_FILE"
    exit 1
fi
