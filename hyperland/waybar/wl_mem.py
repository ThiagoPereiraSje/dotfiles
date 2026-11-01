#!/usr/bin/env python3

import json

def read_meminfo():
  mem = {}
  with open("/proc/meminfo") as f:
    for line in f:
      key, value = line.split(":", 1)
      mem[key] = int(value.strip().split()[0])
  return mem

mem = read_meminfo()

total_kb = mem["MemTotal"]
available_kb = mem["MemAvailable"]
used_kb = total_kb - available_kb

usage_gb = used_kb / 1024 / 1024

css_class = "low"

if usage_gb > 4:
  css_class = "normal"
elif usage_gb > 8:
  css_class = "hight"

output = {
  "text": f"RAM: {usage_gb:.3f} GB",
  "tooltip": "Uso de Memória",
  "class": css_class
}

print(json.dumps(output))