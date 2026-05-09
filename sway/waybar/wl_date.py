#!/usr/bin/env python3
from datetime import datetime

days = [
  "SEGUNDA",
  "TERÇA",
  "QUARTA",
  "QUINTA",
  "SEXTA",
  "SÁBADO",
  "DOMINGO",
]

now = datetime.now()
day = days[now.weekday()]

print(f"{day} {now:%d/%m/%Y}")
