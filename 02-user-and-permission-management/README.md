# Phase 2 — User & Permission Management

## Objective

Configure and verify Linux user accounts, groups, ownership, permissions, and special permission mechanisms on the Ubuntu administration lab.

## Tasks Completed

- Inspected the current user and group configuration
- Created the `linux-admins` administrative group
- Created `analyst01` and `analyst02` user accounts
- Added both analysts to the `linux-admins` group
- Created a shared administration directory
- Configured group ownership and directory permissions
- Applied SGID for group inheritance
- Applied file permissions using `chmod`
- Tested authorized and unauthorized file access
- Demonstrated `umask` behavior
- Configured and tested the sticky bit
- Inspected existing SUID and SGID binaries
- Verified administrative privileges with `sudo`
- Cleaned temporary test artifacts and verified the final lab state

## Lab Configuration

### Users

| User | Purpose |
|---|---|
| `ali` | Administrative account |
| `analyst01` | Security/Linux analyst |
| `analyst02` | Security/Linux analyst |

### Group

```text
linux-admins
