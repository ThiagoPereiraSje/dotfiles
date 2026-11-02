#!/bin/bash

COUNT=$(hyprctl -j clients | jq '[.[] | select(.workspace.name == "special:magic")] | length')

echo "$COUNT"