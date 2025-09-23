#!/usr/bin/env bash
# check_ports.sh
# لیست پورت‌های فعال و پردازه‌های مربوطه، خروجی خوانا و CSV

OUTFILE="ports_processes_$(date +%Y%m%d_%H%M%S).csv"
echo "proto,port,state,pid,program,cmdline" > "$OUTFILE"

# نیاز به sudo برای -p
sudo ss -tulpn | sed -n '1!p' | while read -r line; do
  # مثال خط: tcp    LISTEN   0       128     0.0.0.0:22    0.0.0.0:*    users:(("sshd",pid=1234,fd=3))
  proto=$(echo "$line" | awk '{print $1}')
  state=$(echo "$line" | awk '{print $2}')
  local_addr=$(echo "$line" | awk '{print $5}')
  port=$(echo "$local_addr" | awk -F: '{print $NF}')
  # استخراج pid و program اگر موجود بود
  pid_prog=$(echo "$line" | grep -oP 'pid=\d+|\\(.*\\)' | grep -oP 'pid=\d+' || true)
  # روش ساده‌تر: از ss با --processes استفاده نشده، پس از users: استخراج می‌کنیم
  pid=$(echo "$line" | grep -oP 'pid=\K[0-9]+' || echo "")
  prog=$(echo "$line" | grep -oP '\"[^"]+\"' | head -n1 | tr -d '"' || echo "")
  # cmdline از /proc اگر pid موجود باشد
  if [[ -n "$pid" ]]; then
    cmdline=$(tr '\0' ' ' < /proc/"$pid"/cmdline 2>/dev/null || echo "")
  else
    cmdline=""
  fi
  echo "$proto,$port,$state,$pid,$prog,\"$cmdline\"" >> "$OUTFILE"
done

echo "Saved to $OUTFILE"
