#!/usr/bin/env bash

# Verifica se algum output está ligado
if swaymsg -t get_outputs | grep -q '"dpms": true'; then
  swaymsg 'output * dpms off'
else
  swaymsg 'output * dpms on'
fi
