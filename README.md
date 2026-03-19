# Arch Config

Repository containing configuration files for Arch Linux and the Hyprland environment. Configuration management is handled using GNU Stow.

Author: misiek02
Contact: michalsuski02@gmail.com

## Desktop Preview

## Prerequisites

Before installation, ensure that the following packages are installed on the system:

```bash
sudo pacman -S --noconfirm git openssh
```

## SSH Key Configuration (Required before installation)

Downloading the repository via SSH or pushing changes requires generating and adding an SSH key to your GitHub account:

```bash
ssh-keygen -t ed25519 -C "michalsuski02@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

The displayed string must be copied and added to your GitHub account under Settings -\> SSH and GPG keys. If working in a TTY without a clipboard, you can use termbin to view the key on another device:

```bash
cat ~/.ssh/id_ed25519.pub | nc termbin.com 9999
```

## Quick Installation on a New System

Execute the following commands to clone the repository and run the environment configuration script:

```bash
git clone git@github.com:misiek02/arch_config.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Modular Configuration Structure

The Hyprland configuration is divided into modules for better management. The main file `hyprland.conf` sources the following:

  * monitors.conf - Display settings and global scaling (currently 0.8).
  * env.conf - Environment variables (XCURSOR, GDK\_DPI\_SCALE).
  * binds.conf - Keybindings for applications (kitty, firefox, yazi, wofi).
  * rules.conf - Window and workspace rules.

## Adding New Configurations

1.  Create a folder for the new application reflecting the path relative to the home directory:

<!-- end list -->

```bash
mkdir -p ~/dotfiles/application/.config/application
```

2.  Move the configuration file from the system to the repository:

<!-- end list -->

```bash
mv ~/.config/application/configuration_file ~/dotfiles/application/.config/application/
```

3.  Create symbolic links using stow:

<!-- end list -->

```bash
cd ~/dotfiles
stow application
```

## Pushing Changes to the Remote GitHub Repository

1.  Navigate to the repository directory and add files to the staging area:

<!-- end list -->

```bash
cd ~/dotfiles
git add .
```

2.  Commit the changes with a message:

<!-- end list -->

```bash
git commit -m "Description of introduced changes"
```

3.  Push the local state to the remote server:

<!-- end list -->

```bash
git push
```
