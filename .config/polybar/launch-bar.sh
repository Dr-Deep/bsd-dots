#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Bar
polybar -q bar
