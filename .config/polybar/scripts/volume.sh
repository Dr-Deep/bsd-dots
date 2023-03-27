#!/bin/sh
pactl list sinks 2>/dev/null | grep 'Volume:' | awk '{print $5}' | head -n 1
