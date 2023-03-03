#!/bin/sh
printf "%s" "$(nvidia-smi | head | tail -n1 | awk '{print $13}')"
