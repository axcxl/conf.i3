#!/bin/sh
# shell script to prepend i3status with more stuff
i3status -c ~/.config/i3/i3status.conf | (read line && echo "$line" && read line && echo "$line" && read line && echo "$line" && while :
do
  read line
freemem=$( awk '/MemTotal/ {memtotal=$2}; /MemAvailable/ {memavail=$2}; END { printf("%.0f", (100- (memavail / memtotal * 100))) }' /proc/meminfo )
  echo ",[{\"full_text\":\"MEM:${freemem}%\" },${line#,\[}" || exit 1
done)
