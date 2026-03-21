#!/bin/bash

echo -e "\e[H\e[2J" > /tmp/issue_tty

fastfetch --config ~/dotfiles/fastfetch/.config/fastfetch/tty.jsonc --pipe false >> /tmp/issue_tty

echo -e "\n" >> /tmp/issue_tty

sudo cp /tmp/issue_tty /etc/issue