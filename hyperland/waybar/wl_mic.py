#!/usr/bin/env python3
import subprocess
import re

def get_volume():
  output = subprocess.check_output(
    ["wpctl", "get-volume", "@DEFAULT_AUDIO_SOURCE@"],
    text=True
  )

  muted = "MUTED" in output

  match = re.search(r"Volume:\s+([0-9.]+)", output)
  volume = float(match.group(1)) if match else 0.0

  return int(volume * 100), muted

volume, muted = get_volume()

# Texto
if muted:
  print("MIC: MUTE")
else:
  print(f"MIC: {volume}%")
