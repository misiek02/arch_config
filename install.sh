#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
    git stow hyprland hyprpaper firefox kitty waybar wofi \
    upower yazi fastfetch code networkmanager network-manager-applet \
    bluez bluez-utils rfkill

sudo systemctl enable --now upower
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

sudo rfkill unblock bluetooth
sudo rfkill unblock wifi
bluetoothctl power on

cd ~/dotfiles
stow -R bash
stow -R fastfetch
stow -R hypr
stow -R kitty
stow -R wallpaper
stow -R waybar
stow -R wofi

chmod +x scripts/hypr-conn-ctl.sh
chmod +x scripts/update-tty-login.sh

sudo cp systemd/update-tty.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable update-tty.service

./scripts/update-tty-login.sh