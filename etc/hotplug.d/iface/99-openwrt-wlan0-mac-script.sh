#!/bin/sh

target_mac_addr="d8:cf:bf:a8:ff:f1"
mac_addr=$(ip addr show wlan0 | awk '/ether/ {print $2}')

if [ "$ACTION" = "ifup" ]; then
    if [ "$INTERFACE" = "wlan0" ] || [ "$INTERFACE" = "bridge" ]; then
        if [ "$mac_addr" != "$target_mac_addr" ]; then
            ip link set dev wlan0 down
            ip link set dev wlan0 address "$target_mac_addr"
            ip link set dev wlan0 up
        fi
    fi
fi
