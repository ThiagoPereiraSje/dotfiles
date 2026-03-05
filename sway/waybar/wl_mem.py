import json
import psutil

mem = psutil.virtual_memory()

usage = mem.used / (1024**3)

css_class = "low"

if usage > 4:
  css_class = "normal"
elif usage > 8:
  css_class = "hight"

output = {
  "text": f"RAM: {usage:.3f}%",
  "tooltip": "Uso de Memória",
  "class": css_class
}

print(json.dumps(output))