#!/usr/bin/env python3.9

import psutil
import subprocess

def get_swap_usage_percent(swap_maxpages:int) -> float:
    swap_info = psutil.swap_memory()
    swap_total = swap_info.total / (1024 * 1024)  # in MB

    if swap_total > swap_maxpages:
        swap_total = swap_maxpages * psutil.os.getpagesize() / (1024 * 1024)

    return swap_info.percent


if __name__ == '__main__':
    swap_maxpages = int(
        subprocess.check_output(
            ['sysctl', 'vm.swap_maxpages'],
        ).decode().split(':')[1].strip()
    )

    swap_usage = get_swap_usage_percent(swap_maxpages)
    print(f"{swap_usage}%/0.00GiB")
