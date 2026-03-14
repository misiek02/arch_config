# Dotfiles

Repository containing configuration files for Arch Linux and the Hyprland environment. Configuration management is handled using GNU Stow.

Author: misiek02
Contact: michalsuski02@gmail.com

## Desktop Preview

![My Wallpaper](./wallpaper/.config/hypr/wallpaper.jpg)

## SSH Key Configuration (Required before installation)

Downloading a private repository or pushing changes requires generating and adding an SSH key to your GitHub account:

```bash
ssh-keygen -t ed25519 -C "michalsuski02@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```
The displayed string must be copied and added to your GitHub account under Settings -> SSH and GPG keys.

## Quick Installation on a New System

Executing the following command will install required packages, clone the repository, and run the environment configuration script:

```bash
sudo pacman -S --noconfirm git && git clone git@github.com:misiek02/dotfiles.git ~/dotfiles && ~/dotfiles/install.sh
```

## Adding New Configurations

1. Create a folder for the new application reflecting the path relative to the home directory:
```bash
mkdir -p ~/dotfiles/application/.config/application
```

2. Move the configuration file from the system to the repository:
```bash
mv ~/.config/application/configuration_file ~/dotfiles/application/.config/application/
```

3. Create symbolic links using stow:
```bash
cd ~/dotfiles
stow application
```

## Pushing Changes to the Remote GitHub Repository

1. Navigate to the repository directory and add files to the staging area:
```bash
cd ~/dotfiles
git add .
```

2. Commit the changes with a message:
```bash
git commit -m "Description of introduced changes"
```

3. Push the local state to the remote server:
```bash
git push
```
