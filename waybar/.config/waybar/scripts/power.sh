#!/bin/bash

# Power supply directory
BAT="/sys/class/power_supply/BAT0"

# Check if battery exists
if [ ! -d "$BAT" ]; then
    echo "N/A"
    exit 1
fi

# Get power in microWatts
if [ -f "$BAT/power_now" ]; then
    POWER_UW=$(cat "$BAT/power_now")
elif [ -f "$BAT/current_now" ] && [ -f "$BAT/voltage_now" ]; then
    CURRENT_UA=$(cat "$BAT/current_now")
    VOLTAGE_UV=$(cat "$BAT/voltage_now")
    POWER_UW=$(echo "scale=0; ($CURRENT_UA * $VOLTAGE_UV) / 1000000" | bc)
else
    echo "N/A"
    exit 1
fi

# Convert to Watts
POWER_W=$(echo "scale=1; $POWER_UW / 1000000" | bc)

# Ensure scale output starts with 0 if between -1 and 1
if [[ $POWER_W == .* ]]; then
    POWER_W="0$POWER_W"
fi
if [[ $POWER_W == -.* ]]; then
    POWER_W="-0${POWER_W#*-}"
fi

# Output for Waybar (using bolt icon)
echo "󱐋 ${POWER_W}W"
