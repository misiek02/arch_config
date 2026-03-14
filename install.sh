#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow hyprland hyprpaper

cd ~/dotfiles
stow hypr
stow wallpaper
