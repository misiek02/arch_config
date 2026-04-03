# AI Context Configuration File

System OS: Arch Linux
Environment: Hyprland (Wayland)
Configuration Management: GNU Stow
Working Directory: ~/dotfiles
Remote Git: git@github.com:misiek02/arch_config.git

## Current Directory Structure

.
├── AI_context.md
├── bash
│   ├── .bash_profile
│   └── .bashrc
├── fastfetch
│   └── .config
│       └── fastfetch
│           ├── config.jsonc
│           ├── logo.txt
│           └── tty.jsonc
├── hypr
│   └── .config
│       └── hypr
│           ├── binds.conf
│           ├── colors.conf
│           ├── env.conf
│           ├── hyprland.conf
│           ├── monitors.conf
│           └── rules.conf
├── install.sh
├── kitty
│   └── .config
│       └── kitty
│           ├── colors.conf
│           └── kitty.conf
├── README.md
├── scripts
│   ├── hypr-conn-ctl.sh
│   └── update-tty-login.sh
├── systemd
│   ├── getty_override.conf
│   └── update-tty.service
├── wallpaper
│   └── .config
│       └── hypr
│           ├── hyprpaper.conf
│           ├── Pain.png
│           └── wallpaper1.png
├── waybar
│   └── .config
│       └── waybar
│           ├── colors.css
│           ├── config.jsonc
│           ├── scripts
│           │   └── uptime.sh
│           └── style.css
└── wofi
    └── .config
        └── wofi
            ├── colors.css
            └── style.css

## Configuration Workflow

GNU Stow is used to manage symlinks from ~/dotfiles to the home directory.

Adding new configuration:
1. mkdir -p ~/dotfiles/application/.config/application
2. mv ~/.config/application/file ~/dotfiles/application/.config/application/
3. cd ~/dotfiles
4. stow application

Updating configuration:
1. Edit target files directly in ~/dotfiles/
2. cd ~/dotfiles
3. stow -R application

## Git Synchronization

Changes must be committed locally after every modification to allow easy rollback. Pushing to the remote repository is handled manually.
1. cd ~/dotfiles
2. git add .
3. git commit -m "Description of changes"

## System Specifics

Hyprland Configuration:
- Modularized using source directives in hyprland.conf.
- monitors.conf: Global scale set to 0.8.
- env.conf: Contains specific variables for VMware compatibility (WLR_NO_HARDWARE_CURSORS=1, WLR_RENDERER_ALLOW_SOFTWARE=1, WLR_DRM_NO_ATOMIC=1) and scaling (GDK_DPI_SCALE=0.8, QT_WAYLAND_FORCE_DPI=96).

Waybar Configuration:
- Height: 16px.
- Font-size: 10px.

Installation Script (install.sh):
- Removes default ~/.bashrc and ~/.bash_profile prior to executing stow bash to prevent conflicts.

## Instructions for AI Assistant

1. All code must be in a code block. Do not generate code as common text.
2. Be objective and do not suggest opinions. Sycophancy set to 0. Do not talk like a human.
3. Do not ever boldface anything. Do not use any formatting for emphasis.
4. Do not repeat the prompt. Execute the instruction directly.
5. Never give additional advice outside of what is directly asked.
6. Do not mention the user or any traits. Only focus on the task.
7. Do not praise the user. Assume all provided information is relevant.
8. Treat the local Git commit procedure (git add . and git commit) as a mandatory final step in every modification instruction. Do not include git push, as this is handled manually.