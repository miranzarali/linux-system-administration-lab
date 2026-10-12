# Phase 6: Bash Administration Automation

## Overview

This phase focuses on automating common Linux system administration tasks using Bash scripts. The scripts collect system information, check service status, create Linux users with specified primary groups, and generate compressed backups.

## Objectives

- Automate system information collection.
- Check whether a specified system service is running.
- Create Linux users with input validation and group verification.
- Create timestamped, compressed backups of directories.
- Handle invalid input and report success or failure clearly.

## Scripts Implemented

| Script | Description |
|---|---|
| `system-info.sh` | Displays system information, CPU details, memory usage, root filesystem usage, and network interfaces. |
| `service-check.sh` | Checks whether a specified system service exists and is active. |
| `create-user.sh` | Creates a user with a home directory and specified primary group, with validation and error handling. |
| `backup.sh` | Creates a timestamped `.tar.gz` backup of a source directory in the specified destination. |

## Implementation Details

### 1. System Information

The `system-info.sh` script collects key system details, including the hostname, operating system, kernel version, CPU information, memory usage, root filesystem capacity, and network interfaces.

**Execution:**

```bash
~/automation-lab/system-info.sh
```

![System information report](screenshots/06-system-info-report.png)

### 2. Service Status Check

The `service-check.sh` script accepts a service name as an argument and checks whether the corresponding systemd service unit exists and is active.

**Execution:**

```bash
~/automation-lab/service-check.sh open-vm-tools
```

**Result:** The service was detected as running.

![Service check result](screenshots/06-service-check.png)

### 3. Automated User Creation

The `create-user.sh` script validates the username, checks that the specified group exists, prevents duplicate user creation, and creates the user with a home directory and Bash shell.

**Execution:**

```bash
sudo groupadd automation-test
sudo ~/automation-lab/create-user.sh automation01 automation-test
id automation01
```

**Result:** The test user was created successfully, and its primary group was verified.

![User creation and verification](screenshots/06-user-creation.png)

The temporary test user and group were removed after verification.

### 4. Automated Directory Backup

The `backup.sh` script validates its input directories and creates a compressed archive with a timestamp in its filename. It also prevents the destination from being inside the source directory.

**Execution:**

```bash
mkdir -p ~/automation-lab/test-data
echo "Linux admin backup test" > ~/automation-lab/test-data/sample.txt
~/automation-lab/backup.sh ~/automation-lab/test-data ~/automation-lab/backups
```

**Result:** A timestamped `.tar.gz` backup was created successfully.

![Backup creation result](screenshots/06-backup-result.png)

## Error Handling and Safety

- Validates required command-line arguments.
- Checks username format and existing users before account creation.
- Requires administrative privileges for user creation.
- Verifies that the requested group exists.
- Checks the source directory before creating a backup.
- Rejects invalid backup destinations.
- Returns appropriate exit codes for success and failure conditions.

## Skills Demonstrated

- Bash scripting and command-line argument handling
- Linux user and group administration
- System information and resource monitoring
- systemd service management
- Directory archiving and backup automation
- Input validation and error handling
- Linux command-line utilities

## Outcome

Implemented and tested four Bash scripts that automate practical Linux system administration tasks. These scripts provide a foundation for reusable administrative automation and can be integrated into a unified Linux administration toolkit in a later phase.
