#!/bin/bash

printf "\033c" > /etc/issue

/usr/bin/fastfetch --config /home/michal/dotfiles/fastfetch/.config/fastfetch/tty.jsonc --pipe false | sed 's/\\/\\\\/g' >> /etc/issue

printf "\n" >> /etc/issue