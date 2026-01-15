#!/usr/bin/env python3

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

used_gb = used_kb / 1024 / 1024

color = "#98c379"

if used_gb > 4:
  color = "#e5c07b"
elif used_gb > 8:
  color = "#e06c75"

print(f"<span color='{color}'>RAM: {used_gb:.3f} GB</span>")
