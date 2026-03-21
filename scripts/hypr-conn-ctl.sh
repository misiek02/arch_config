#!/bin/bash

wifi_status=$(nmcli -t -f WIFI g)
if [ "$wifi_status" = "enabled" ]; then
    wifi_opt="WIFI: ON (Wylacz)"
    networks=$(nmcli -t -f SSID dev wifi list | sed '/^--/d' | sort -u)
else
    wifi_opt="WIFI: OFF (Wlacz)"
    networks=""
fi

bt_status=$(bluetoothctl show | grep "Powered: yes" > /dev/null && echo "on" || echo "off")
if [ "$bt_status" = "on" ]; then
    bt_opt="BT: ON (Wylacz)"
else
    bt_opt="BT: OFF (Wlacz)"
fi

choice=$(echo -e "$wifi_opt\n$bt_opt\n---\n$networks" | wofi -dmenu -p "Polaczenia" -i -L 10 -w 300)

case "$choice" in
    "$wifi_opt")
        if [ "$wifi_status" = "enabled" ]; then nmcli radio wifi off; else nmcli radio wifi on; fi
        ;;
    "$bt_opt")
        if [ "$bt_status" = "on" ]; then bluetoothctl power off; else bluetoothctl power on; fi
        ;;
    "---"|"")
        exit 0
        ;;
    *)
        nmcli dev wifi connect "$choice"
        ;;
esac
