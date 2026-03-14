#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper firefox kitty

cd ~/dotfiles
stow hypr
stow wallpaper
