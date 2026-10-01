# Phase 1 — Commands Used

## 1. Filesystem

```bash
ls -ld /
ls -ld /etc /var /home /usr /opt /tmp /boot /proc /sys /dev
df -Th /

2. System Information
hostnamectl --static
grep PRETTY_NAME /etc/os-release
uname -r
uname -m
nproc
free -h
uptime -p

3. Hostname
hostname
hostnamectl status --static
cat /etc/hostname

4. Environment Variables
echo "$USER"
echo "$HOME"
echo "$SHELL"
echo "$PWD"
echo "$PATH"

Temporary environment variable:
export LAB_NAME="Linux-System-Administration-Lab"
echo "$LAB_NAME"
bash -c 'echo "Child shell: $LAB_NAME"'

5. PATH
echo "$PATH"
command -v bash
command -v ls

6. Package Management
apt --version
grep -RhvE '^[[:space:]]*(#|$)' /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null
sudo apt update

7. Networking
ip -br addr
ip route
resolvectl status

8. Final Verification
hostnamectl --static
grep PRETTY_NAME /etc/os-release
uname -r
df -h /
ip -br addr
ip route
echo "$PATH"
apt list --upgradable 2>/dev/null | tail -n +2 | wc -l

Notes
All commands were executed directly on the Ubuntu administration VM and verified during Phase 1.

### Commit message

At the bottom, commit with exactly:

```text
Add Phase 1 command reference
