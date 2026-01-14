#!/bin/bash

OUT=$(LC_ALL=C wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
VOL=$(echo "$OUT" | awk '{print $2}')

if echo "$OUT" | grep -q MUTED; then
  echo "MIC: MUTE"
else
  echo "MIC: ${VOL}%"
fi
