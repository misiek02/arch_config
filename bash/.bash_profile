if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec start-hyprland
fi
export PS1="\[\033[0;92m\]\u\[\033[0m\]@arch:\[\033[0;94m\]\w\[\033[0m\]\$ "
