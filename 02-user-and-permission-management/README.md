# Phase 2 — Users, Groups & Permissions

## Objective

Build and verify a Linux user and group management environment with controlled access to a shared administrative resource.

This phase covers user management, group management, ownership, permissions, SGID, umask, sticky bit, SUID/SGID, sudo privileges, access control, and permission verification.

---

## 1. User and Group Identification

The existing administrative user and group memberships were verified.

```bash
whoami
id
groups
grep "^$USER:" /etc/passwd
getent group "$USER"
```

The administrative account was verified as:

- User: `ali`
- UID: `1000`
- Primary group: `ali`
- Administrative group: `sudo`

---

## 2. Create Administrative Group and Users

A dedicated administrative group and two test users were created.

```bash
sudo groupadd linux-admins

sudo useradd -m -s /bin/bash analyst01
sudo useradd -m -s /bin/bash analyst02

sudo usermod -aG linux-admins analyst01
sudo usermod -aG linux-admins analyst02
```

Verification:

```bash
id analyst01
id analyst02
getent group linux-admins
```

Result:

```text
linux-admins:x:1001:analyst01,analyst02
```

Both test users were successfully added to the `linux-admins` group.

---

## 3. Create Shared Administrative Resource

A shared directory and project file were created under `/srv`.

```bash
sudo mkdir -p /srv/linux-admin-lab

echo "Linux Administration Lab - Shared Resource" | sudo tee /srv/linux-admin-lab/project.txt > /dev/null
```

The directory and file were assigned to the `linux-admins` group.

```bash
sudo chown -R root:linux-admins /srv/linux-admin-lab
```

---

## 4. Shared Directory Permissions

The shared directory was configured with SGID permissions.

```bash
sudo chmod 2770 /srv/linux-admin-lab
sudo chmod 660 /srv/linux-admin-lab/project.txt
```

Resulting permissions:

```text
drwxrws--- root linux-admins /srv/linux-admin-lab
-rw-rw---- root linux-admins /srv/linux-admin-lab/project.txt
```

### Permission Model

The directory provides:

- Owner: read, write, execute
- Group: read, write, execute
- Others: no access

The leading `2` in `2770` enables the SGID bit.

---

## 5. Verify Group-Based Access

Both analyst accounts were verified as members of the administrative group.

```bash
id analyst01
id analyst02
getent group linux-admins
```

Access was tested using both users.

```bash
sudo -u analyst01 cat /srv/linux-admin-lab/project.txt
sudo -u analyst02 cat /srv/linux-admin-lab/project.txt
```

`analyst01` was also able to modify the shared file.

```bash
sudo -u analyst01 sh -c 'echo "Created by analyst01" >> /srv/linux-admin-lab/project.txt'
```

This demonstrated group-based read/write access.

---

## 6. Verify Restricted Access

The administrative user `ali` was tested against the shared resource.

```bash
sudo -u ali cat /srv/linux-admin-lab/project.txt
```

The operation returned:

```text
Permission denied
```

This confirmed that access to the shared resource is controlled through the `linux-admins` group.

![Shared resource access](screenshots/02-users-permissions-verification%281%29.png)

---

## 7. Verify Permissions and SGID

File and directory permissions were inspected using `stat` and `namei`.

```bash
sudo stat -c '%A %a %U %G %n' /srv/linux-admin-lab/project.txt

sudo namei -l /srv/linux-admin-lab/project.txt
```

The project file was confirmed as:

```text
-rw-rw---- 660 root linux-admins /srv/linux-admin-lab/project.txt
```

The directory was confirmed as:

```text
drwxrws--- root linux-admins /srv/linux-admin-lab
```

The `s` in the group permission position confirms that SGID is enabled.

![Permissions and SGID verification](screenshots/02-permission-ownership%281%29.png)

---

## 8. SGID Inheritance Test

A test file was created by `analyst01` inside the SGID directory.

```bash
sudo -u analyst01 bash -c 'echo "SGID inheritance test" > /srv/linux-admin-lab/sgid-test.txt'
```

The resulting file inherited the `linux-admins` group ownership.

```text
-rw-r--r-- analyst01 linux-admins sgid-test.txt
```

### Observation

The SGID directory causes newly created files to inherit the directory's group ownership.

This is useful for collaborative administrative directories.

---

## 9. Umask Verification

The default `umask` was checked.

```bash
umask
```

The test user reported:

```text
0022
```

Files and directories created with this umask resulted in:

```text
-rw-r--r--
drwxr-xr-x
```

### Observation

`umask` determines which permission bits are removed from newly created files and directories.

A `0022` umask prevents group and other users from receiving write permission by default.

---

## 10. Sticky Bit

A shared temporary directory was created and configured with the sticky bit.

```bash
sudo mkdir -p /srv/linux-admin-lab/shared-temp
sudo chmod 1777 /srv/linux-admin-lab/shared-temp
```

Resulting permissions:

```text
drwxrwsrwt root linux-admins /srv/linux-admin-lab/shared-temp
```

The `t` at the end confirms the sticky bit.

Two users created files in the directory.

```bash
sudo -u analyst01 bash -c 'echo "Analyst 01 file" > /srv/linux-admin-lab/shared-temp/analyst01.txt'

sudo -u analyst02 bash -c 'echo "Analyst 02 file" > /srv/linux-admin-lab/shared-temp/analyst02.txt'
```

`analyst01` attempted to delete the file owned by `analyst02`.

The operation failed with:

```text
Operation not permitted
```

![Sticky bit access control](screenshots/02-special-permissions%281%29.png)

### Observation

The sticky bit prevents users from deleting or renaming files owned by other users in a shared writable directory.

---

## 11. SUID and SGID Awareness

Existing SUID and SGID binaries were identified.

```bash
find /usr/bin /usr/sbin -type f -perm -4000 -user root 2>/dev/null | head -10

find /usr/bin /usr/sbin -type f -perm -2000 -user root 2>/dev/null | head -10
```

### SUID

A SUID executable runs with the effective privileges of its file owner.

### SGID

SGID on an executable causes it to run with the effective group privileges associated with the file.

SGID on a directory causes newly created files and directories to inherit the directory's group ownership.

---

## 12. Sudo Privileges

Current privileges were verified.

```bash
id
sudo -l
```

The administrative account was confirmed to have sudo access:

```text
(ALL : ALL) ALL
```

This demonstrates full administrative privileges through `sudo`.

---

## 13. Final Lab State

Temporary test artifacts were removed after verification.

Final lab structure:

```text
/srv/linux-admin-lab/
├── project.txt
└── shared-temp/
```

Final permissions:

```text
drwxrws--- root linux-admins /srv/linux-admin-lab
drwxrwsrwt root linux-admins /srv/linux-admin-lab/shared-temp
-rw-rw---- root linux-admins /srv/linux-admin-lab/project.txt
```

The lab was returned to a clean state after testing.

![Final lab state](screenshots/04-final-lab-state.png)

---

## Key Concepts Learned

- Linux users and UIDs
- Primary and supplementary groups
- `/etc/passwd`
- Group management
- File ownership
- Linux permission model
- Numeric permissions
- SGID directories
- Group inheritance
- `umask`
- Sticky bit
- SUID and SGID executables
- `sudo` privileges
- Access control testing
- Permission troubleshooting
- Shared-resource administration

---

## Security Relevance

Proper user, group, ownership, and permission management is a fundamental Linux security control.

This lab demonstrates how access can be granted to authorized users through group membership while preventing unauthorized accounts from accessing protected resources.

These principles are directly applicable to Linux servers, security operations environments, application servers, and enterprise infrastructure.
