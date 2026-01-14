#!/bin/bash

OUT=$(LC_ALL=C wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOL=$(echo "$OUT" | awk '{print $2}')

if echo "$OUT" | grep -q MUTED; then
  echo "VOL: MUTE"
else
  echo "VOL: ${VOL}%"
fi
