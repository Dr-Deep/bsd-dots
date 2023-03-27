#!/usr/bin/env python3.9

import psutil

cpu_percent = psutil.cpu_percent(interval=0.1)
print(f"{cpu_percent}%")
