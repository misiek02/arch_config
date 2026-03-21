#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed base-devel git

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~/dotfiles
fi

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

# Konfiguracja override dla agetty, aby nie czyscil ekranu i uzywal skryptu
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp systemd/getty_override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

# Zmiana parametrów agetty dla tty1 (dodanie --noclear)
sudo mkdir -p /etc/systemd/system/getty@.service.d
echo -e "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noclear %I \$TERM" | sudo tee /etc/systemd/system/getty@.service.d/noclear.conf

sudo systemctl daemon-reload
sudo systemctl restart getty@tty1.service