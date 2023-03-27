#!/usr/bin/env python3.9

import subprocess

def get_mem_usage_percent(physmem:int, inactive:int, laundry:int, free:int) -> float:
    available = inactive + free + laundry
    used = physmem - available
    usedPercent = float(used) / float(physmem) * 100.0

    return usedPercent

def sysctl_int(name:str) -> int:
    out = subprocess.check_output(["sysctl", "-n" ,name])
    return int(out.decode())


if __name__ == "__main__":
    page_size = sysctl_int("vm.stats.vm.v_page_size")
    physmem = sysctl_int("hw.physmem")
    inactive = sysctl_int("vm.stats.vm.v_inactive_count")
    laundry = sysctl_int("vm.stats.vm.v_laundry_count")
    free = sysctl_int("vm.stats.vm.v_free_count")

    mem_usage = get_mem_usage_percent(
        physmem,
        inactive*page_size,
        laundry*page_size,
        free*page_size,
    )

    mem_usage = round(mem_usage / 1024*1024, 1)
    mem_total_gb = round(float(physmem) / (1024*1024*1024), 2)

    print(f"{mem_usage}%/{mem_total_gb:.2f}G")
