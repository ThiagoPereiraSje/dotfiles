#!/bin/bash

DATA=$(LC_TIME=pt_BR.UTF-8 date +"%A %d de %B de %Y %H:%M")

# Capitaliza primeira letra do dia e do mês
DATA_FORMATADA=$(echo "$DATA" | sed -E 's/^./\U&/; s/ de ([a-z])/\ de \U\1/')

echo "$DATA_FORMATADA"
