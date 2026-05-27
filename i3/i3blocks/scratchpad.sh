#!/bin/bash

i3-msg -t get_tree | jq -r '
recurse(.nodes[]?, .floating_nodes[]?)
| select(.scratchpad_state != "none")
| .class
' | paste -sd " | " -