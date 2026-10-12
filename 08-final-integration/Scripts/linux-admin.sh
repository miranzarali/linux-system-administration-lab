#!/usr/bin/env bash

set -u

SYSTEM_INFO="$HOME/automation-lab/system-info.sh"
SERVICE_CHECK="$HOME/automation-lab/service-check.sh"
USER_CREATE="$HOME/automation-lab/create-user.sh"
BACKUP="$HOME/automation-lab/backup.sh"
DISK_REPORT="$HOME/storage-lab/disk-report.sh"
NETWORK_CHECK="$HOME/network-lab/network-check.sh"
MAINTENANCE="$HOME/maintenance-lab/maintenance-report.sh"

pause() {
    echo
    read -r -p "Press Enter to return to the menu..."
}

run_script() {
    local script="$1"
    shift

    if [[ -x "$script" ]]; then
        "$script" "$@"
    else
        echo "[ERROR] Script not found or not executable: $script"
    fi

    pause
}

while true; do
    clear

    echo "========================================"
    echo "     Linux Administration Toolkit"
    echo "========================================"
    echo "1. System Information"
    echo "2. Check Service Status"
    echo "3. Create User"
    echo "4. Directory Backup"
    echo "5. Disk Usage Report"
    echo "6. Network Diagnostics"
    echo "7. Maintenance Report"
    echo "8. Exit"
    echo "========================================"

    read -r -p "Select an option [1-8]: " choice

    case "$choice" in
        1)
            run_script "$SYSTEM_INFO"
            ;;
        2)
            read -r -p "Enter service name: " service
            if [[ -n "$service" ]]; then
                run_script "$SERVICE_CHECK" "$service"
            else
                echo "[ERROR] Service name cannot be empty."
                pause
            fi
            ;;
        3)
            read -r -p "Enter username: " username
            read -r -p "Enter existing primary group: " group

            if [[ -n "$username" && -n "$group" ]]; then
                echo "User creation requires administrative privileges."
                sudo "$USER_CREATE" "$username" "$group"
            else
                echo "[ERROR] Username and group are required."
            fi
            pause
            ;;
        4)
            read -r -p "Enter source directory: " source
            read -r -p "Enter backup destination: " destination

            if [[ -n "$source" && -n "$destination" ]]; then
                run_script "$BACKUP" "$source" "$destination"
            else
                echo "[ERROR] Both directories are required."
                pause
            fi
            ;;
        5)
            run_script "$DISK_REPORT"
            ;;
        6)
            run_script "$NETWORK_CHECK"
            ;;
        7)
            run_script "$MAINTENANCE"
            ;;
        8)
            echo "Exiting Linux Administration Toolkit."
            exit 0
            ;;
        *)
            echo "[ERROR] Invalid option. Select 1-8."
            pause
            ;;
    esac
done
