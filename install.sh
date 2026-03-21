#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper firefox kitty waybar wofi
sudo pacman -S --noconfirm upower yazi fastfetch code networkmanager network-manager-applet
sudo pacman -S --noconfirm bluez bluez-utils

sudo systemctl enable --now upower
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

cd ~/dotfiles
stow bash
stow fastfetch
stow hypr
stow kitty
stow wallpaper
stow waybar
stow wofi
