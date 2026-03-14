#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper firefox kitty waybar wofi

cd ~/dotfiles
stow hypr
stow wallpaper
stow waybar
stow wofi
