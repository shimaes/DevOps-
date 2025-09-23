# DevOps-
Learning DevOps 
# Ubuntu — Check active ports & processes

A short guide and simple script to list listening network ports and the processes that opened them on Ubuntu.

## Commands
- `sudo ss -tulnp` — modern tool
- `sudo netstat -tulpn` — if available
- `sudo lsof -i -P -n` — list open network files

## Script
Run:
```bash
chmod +x check_ports.sh
./check_ports.sh
