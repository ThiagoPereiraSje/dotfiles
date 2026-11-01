#!/bin/sh

OUT=$(LC_ALL=C wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
VOL=$(echo "$OUT" | awk '{print $2}')

if echo "$OUT" | grep -q MUTED; then
  echo "<span foreground='#4c7899'></span> ${VOL}%"
else
  echo ""
fi
