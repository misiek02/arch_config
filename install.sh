#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper firefox kitty waybar wofi
sudo pacman -S --noconfirm upower yazi fastfetch code networkmanager network-manager-applet

sudo systemctl enable --now upower
sudo systemctl enable --now NetworkManager

cd ~/dotfiles
stow bash
stow fastfetch
stow hypr
stow kitty
stow wallpaper
stow waybar
stow wofi
