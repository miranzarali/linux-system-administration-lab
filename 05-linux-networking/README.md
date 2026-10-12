# Phase 5 — Linux Networking & Troubleshooting

## Objective

Implement a reusable Bash diagnostic script to inspect Linux network configuration, connectivity, DNS resolution, and listening ports.

## Environment

- Operating System: Ubuntu
- Virtualization: VMware
- Network Interface: `ens33`

## Implementation

Created `network-check.sh` to generate a network diagnostic report containing:

- Network interface addresses using `ip -br addr`
- Routing table using `ip route`
- DNS configuration using `resolvectl status`
- Listening ports and associated processes using `ss -lntup`
- External IP connectivity test using `ping`
- DNS resolution test using `getent hosts`

## Execution

```bash
chmod +x ~/network-lab/network-check.sh
~/network-lab/network-check.sh
```

## Results

- Identified the active `ens33` interface and its IPv4 configuration.
- Inspected the default route and DNS configuration.
- Listed listening sockets and associated processes where available.
- Confirmed external IP connectivity and DNS resolution during the captured run.

## Screenshots

### Network Diagnostic Report

![Network Diagnostic Report](screenshots/05-network-diagnostic-report.png)

### Network Check Script

![Network Check Script](screenshots/05-network-check-script.png)

## Outcome

Implemented a reusable Linux networking diagnostic script to assist with basic connectivity and configuration troubleshooting.

## Tools Used

`Bash`, `ip`, `resolvectl`, `ss`, `ping`, `getent`
