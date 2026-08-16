#!/usr/bin/env python3
import subprocess
import re

def get_volume():
  output = subprocess.check_output(
    ["amixer", "get", "Mic"],
    text=True
  )

  volume_match = re.search(r"\[(\d+)%\]", output)
  mute_match = re.search(r"\[(on|off)\]", output)

  volume = int(volume_match.group(1)) if volume_match else 0
  muted = mute_match.group(1) == "off" if mute_match else False

  return volume, muted

volume, muted = get_volume()

# Texto
if muted:
  print("MIC: MUTE")
else:
  print(f"MIC: {volume}%")
