#!/usr/bin/env python3
import json
import time

def read_cpu():
  with open("/proc/stat") as f:
    fields = f.readline().strip().split()[1:]
    values = list(map(int, fields))
    idle = values[3] + values[4]        # idle + iowait
    total = sum(values)
    return idle, total

idle1, total1 = read_cpu()
time.sleep(1)
idle2, total2 = read_cpu()

idle_delta = idle2 - idle1
total_delta = total2 - total1

usage = 100 * (1 - idle_delta / total_delta)

css_class = "low"

if usage > 40:
  css_class = "normal"
elif usage > 70:
  css_class = "hight"

output = {
  "text": f"CPU: {usage:.1f}%",
  "tooltip": "Uso da CPU",
  "class": css_class
}

print(json.dumps(output))
