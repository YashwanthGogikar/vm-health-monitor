#!/bin/bash

shopt -s nocasematch
EXPLAIN=false
[[ "$1" == "explain" ]] && EXPLAIN=true

CPU=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')
CPU_INT=${CPU%.*}

MEM=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

STATUS="healthy"
REASON=""

(( CPU_INT >= 75 )) && STATUS="unhealthy" && REASON+="CPU "
(( MEM >= 70 )) && STATUS="unhealthy" && REASON+="Memory "
(( DISK >= 90 )) && STATUS="unhealthy" && REASON+="Disk "

echo "System is $STATUS (CPU, Memory, Disk checked against thresholds)"

if $EXPLAIN; then
  if [[ "$STATUS" == "healthy" ]]; then
    echo "All metrics are below threshold limits"
  else
    echo "Unhealthy due to: $REASON"
  fi

  echo "---- Top CPU Consumers ----"
  ps -eo pid,comm,%cpu --sort=-%cpu | head -4

  echo "---- Top Memory Consumers ----"
  ps -eo pid,comm,%mem --sort=-%mem | head -4

  echo "---- Disk Usage (Top directories in /) ----"
  du -h / 2>/dev/null | sort -rh | head -3
fi
