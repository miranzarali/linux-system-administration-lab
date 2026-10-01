# 01 — Linux System Configuration

## Objective

Configure and verify the core operating-system environment of the Ubuntu administration lab.

This phase establishes the system baseline required for later user management, service administration, storage management, networking, and automation.

## Environment

- OS: Ubuntu 26.04.1 LTS
- Hostname: `ubuntu-admin-lab`
- Kernel: `7.0.0-34-generic`
- Architecture: `x86_64`
- CPU: 4 vCPU
- Memory: 4 GB allocated
- Root filesystem: 40 GB ext4
- Network interface: `ens33`
- Network mode: VMware NAT

## Configuration Performed

### 1. Linux Filesystem Structure

Inspected the major Linux filesystem directories:

- `/etc` — system configuration
- `/var` — variable data, logs, caches
- `/home` — user home directories
- `/usr` — installed applications and system resources
- `/opt` — optional/third-party software
- `/tmp` — temporary files
- `/boot` — boot-related files
- `/proc` — kernel and process information
- `/sys` — kernel and device information
- `/dev` — device interfaces

The root filesystem was verified as an `ext4` filesystem.

### 2. System Information

Verified:

- Operating system
- Kernel version
- Architecture
- CPU allocation
- Memory
- System uptime

### 3. Hostname

The system hostname was configured as:

```text
ubuntu-admin-lab
