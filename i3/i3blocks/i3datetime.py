#!/usr/bin/env python3
from datetime import datetime

dias = [
  "SEGUNDA",
  "TERÇA",
  "QUARTA",
  "QUINTA",
  "SEXTA",
  "SÁBADO",
  "DOMINGO",
]

now = datetime.now()
dia = dias[now.weekday()]

print(f"{dia} {now:%d/%m/%Y %H:%M}")
