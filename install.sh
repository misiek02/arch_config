#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper firefox kitty waybar wofi
sudo pacman -S --noconfirm upower yazi fastfetch

sudo systemctl enable --now upower

cd ~/dotfiles
stow bash
stow hypr
stow wallpaper
stow waybar
stow wofi
