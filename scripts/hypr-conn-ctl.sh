#!/bin/bash

wifi_status=$(nmcli -t -f WIFI g)
if [ "$wifi_status" = "enabled" ]; then
    wifi_header="WIFI: ON"
    networks=$(nmcli -t -f SSID dev wifi list | sed '/^--/d' | sort -u | sed 's/^/  /')
else
    wifi_header="WIFI: OFF"
    networks="  Wylaczone"
fi

bt_status=$(bluetoothctl show | grep "Powered: yes" > /dev/null && echo "on" || echo "off")
if [ "$bt_status" = "on" ]; then
    bt_header="BT: ON"
    devices=$(bluetoothctl devices | cut -d ' ' -f 3- | sed 's/^/  /')
else
    bt_header="BT: OFF"
    devices="  Wylaczone"
fi

menu_content="$wifi_header\n$networks\n$bt_header\n$devices"

choice=$(echo -e "$menu_content" | wofi -dmenu -p "Polaczenia" -i -L 15 -w 350)

if [[ "$choice" == "WIFI: ON" ]]; then
    nmcli radio wifi off
elif [[ "$choice" == "WIFI: OFF" ]]; then
    nmcli radio wifi on
elif [[ "$choice" == "BT: ON" ]]; then
    bluetoothctl power off
elif [[ "$choice" == "BT: OFF" ]]; then
    rfkill unblock bluetooth
    bluetoothctl power on
elif [[ "$choice" == "  Wylaczone" || -z "$choice" ]]; then
    exit 0
else
    selected=$(echo "$choice" | sed 's/^  //')
    if echo "$menu_content" | grep -A 10 "WIFI:" | grep -q "$selected"; then
        nmcli dev wifi connect "$selected"
    else
        bluetoothctl connect $(bluetoothctl devices | grep "$selected" | cut -d ' ' -f 2)
    fi
fi