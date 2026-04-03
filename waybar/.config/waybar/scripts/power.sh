#!/bin/bash

# Power supply directory
BAT="/sys/class/power_supply/BAT0"

# Check if battery exists
if [ ! -d "$BAT" ]; then
    echo "󱐋 N/A"
    exit 0
fi

# Get power in microWatts
if [ -f "$BAT/power_now" ]; then
    POWER_UW=$(cat "$BAT/power_now")
elif [ -f "$BAT/current_now" ] && [ -f "$BAT/voltage_now" ]; then
    CURRENT_UA=$(cat "$BAT/current_now")
    VOLTAGE_UV=$(cat "$BAT/voltage_now")
    # awk calculation: (uA * uV) / 10^12 = W
    POWER_UW=$(awk "BEGIN {print $CURRENT_UA * $VOLTAGE_UV / 1000000}")
else
    echo "󱐋 ?"
    exit 0
fi

# Convert to Watts using awk (uW / 1,000,000)
POWER_W=$(awk "BEGIN {printf \"%.1f\", $POWER_UW / 1000000}")

# Output for Waybar
echo "󱐋 ${POWER_W}W"
