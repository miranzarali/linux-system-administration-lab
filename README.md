# Linux System Administration Lab

A practical Linux system administration laboratory built on Ubuntu Linux in VMware.

The project focuses on developing hands-on Linux administration skills through configuration, testing, troubleshooting, automation, and documentation.

## Objectives

- Configure and administer a Linux system
- Manage users, groups, permissions, and sudo access
- Manage processes and systemd services
- Configure storage and persistent mounts
- Perform Linux-side network administration and troubleshooting
- Automate administrative tasks using Bash
- Schedule maintenance and backup tasks
- Build a reusable Linux administration toolkit

## Environment

| Component | Configuration |
|---|---|
| Operating System | Ubuntu 26.04.1 LTS |
| Virtualization | VMware |
| CPU | 4 vCPU |
| Memory | 4 GB RAM |
| Storage | 40 GB virtual disk |
| Network | NAT |
| Primary User | ali |
| Hostname | ubuntu-admin-lab |

## Project Methodology

The lab follows this workflow:

> Understand → Execute → Intentionally Test → Troubleshoot → Automate → Document

The objective is not only to configure Linux systems, but to understand how an administrator verifies, troubleshoots, and maintains them.

## Project Phases

### 00 — Lab Foundation
Ubuntu installation, VMware integration, system baseline, and package-management configuration.

### 01 — System Configuration
Filesystem structure, hostname, system information, environment variables, PATH, repositories, and basic system configuration.

### 02 — Users & Permissions
Users, groups, passwords, ownership, permissions, umask, special permissions, and sudo.

### 03 — Processes & Services
Process management, jobs, signals, systemd services, journald, and custom service creation.

### 04 — Storage
Disk management, filesystems, mounting, `/etc/fstab`, and basic LVM.

### 05 — Networking
Linux network interfaces, routing, DNS, sockets, neighbor discovery, and troubleshooting.

### 06 — Bash Automation
Practical administrative scripts for system information, users, disks, services, and backups.

### 07 — Scheduling & Maintenance
Cron, systemd timers, automated backups, log maintenance, updates, and cleanup.

### 08 — Final Toolkit
Integration of administrative functions into a reusable Linux administration toolkit.

## Documentation

Each phase documents:

- Configuration performed
- Commands used
- Purpose of commands
- Verification
- Troubleshooting
- Evidence
- Final result
- Interview-relevant concepts

## Evidence

The following evidence was captured during the lab setup:
## Project Evidence

### Linux System Configuration
- [Ubuntu System Configuration](../01-system-configuration/screenshots/)
- [VMware Tools Verification](../01-system-configuration/screenshots/)

### User and Permission Management
- [User and Permission Verification](../02-user-and-permission-management/screenshots/02-users-permissions-verification.png)
- [Special Permissions](../02-user-and-permission-management/screenshots/02-special-permissions.png)

### Processes and Services
- [Service Management](../03-processes-and-services/screenshots/03-service-management.png)
- [Log Analysis](../03-processes-and-services/screenshots/03-log-analysis.png)

### Storage Management
- [Storage Usage Report](../04-storage-management/screenshots/04-storage-usage-report.png)

### Linux Networking
- [Network Diagnostic Report](../05-linux-networking/screenshots/05-network-diagnostic-report.png)

### Bash Administration Automation
- [System Information Report](../06-bash-automation/screenshots/06-system-info-report.png)
- [Service Check](../06-bash-automation/screenshots/06-service-check.png)
- [User Creation Verification](../06-bash-automation/screenshots/06-user-creation.png)
- [Backup Creation](../06-bash-automation/screenshots/06-backup-result.png)

### Scheduling and Maintenance
- [Maintenance Report](../07-scheduling-and-maintenance/screenshots/07-maintenance-report.png)
- [Cron Configuration and Verification](../07-scheduling-and-maintenance/screenshots/07-maintenance-cron-verification.png)

### Final Integration
- [Administration Toolkit Menu](../08-final-integration/screenshots/08-admin-toolkit-menu.png)
- [Integrated System Information](../08-final-integration/screenshots/08-admin-toolkit-system-info.png)
- [Integrated Network Diagnostics](../08-final-integration/screenshots/08-admin-toolkit-network-diagnostics.png)

These screenshots provide evidence of the environment preparation and initial system configuration.

## Status

| Phase | Status |
|---|---|
| 00 — Lab Foundation | ✅ Completed |
| 01 — System Configuration | ✅ Completed |
| 02 — Users & Permissions | ✅ Completed |
| 03 — Processes & Services | ✅ Completed |
| 04 — Storage | ✅ Completed |
| 05 — Networking | ✅ Completed |
| 06 — Bash Automation |✅ Completed |
| 07 — Scheduling & Maintenance | ✅ Completed |
| 08 — Final Toolkit | ✅ Completed |
