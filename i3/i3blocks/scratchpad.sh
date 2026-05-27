#!/bin/bash

count=$(i3-msg -t get_tree | jq '
[
  recurse(.nodes[]?, .floating_nodes[]?)
  | select(.scratchpad_state != "none")
] | length
')

echo "  $count"