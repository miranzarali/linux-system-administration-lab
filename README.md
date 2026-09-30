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

- [Ubuntu ISO integrity verification](./screenshots/ubuntu-iso-integrity.png)
- [VM hardware configuration](./screenshots/vm-hardware-configuration.png)
- [VMware Tools verification](./screenshots/vmware-tools-verified.png)
- [APT repository configuration](./screenshots/apt-repositories.png)
- [APT repository verification](./screenshots/apt-repositories2.png)
- [Package update status](./screenshots/apt-update-before-upgrade.png)
- [GitHub repository initialization](./screenshots/phase-00-github-repository-created.png.png)

These screenshots provide evidence of the environment preparation and initial system configuration.

## Status

| Phase | Status |
|---|---|
| 00 — Lab Foundation | ✅ Completed |
| 01 — System Configuration | ⬜ Not started |
| 02 — Users & Permissions | ⬜ Not started |
| 03 — Processes & Services | ⬜ Not started |
| 04 — Storage | ⬜ Not started |
| 05 — Networking | ⬜ Not started |
| 06 — Bash Automation | ⬜ Not started |
| 07 — Scheduling & Maintenance | ⬜ Not started |
| 08 — Final Toolkit | ⬜ Not started |
