#!/bin/bash

OUTPUT="md_sub.md"

curl "$@" \
| sed '/WEBVTT/d; /-->/d; /^[0-9]\+$/d; /^$/d' \
> "$OUTPUT"

echo "Finalizado."