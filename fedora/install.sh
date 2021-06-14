#!/bin/bash

# Add Sublime Text 4 repo
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Add VSCode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Add RPMFusion repositories (Free/Non-free)
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-34.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-34.noarch.rpm

# Install Google Chrome and Vivaldi
sudo dnf in -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Install Google Chrome and Vivaldi
sudo dnf in -y https://downloads.vivaldi.com/stable/vivaldi-stable-4.0.2312.27-1.x86_64.rpm

# Install packages
sudo dnf in -y kitty neovim neofetch htop gnome-tweaks flatpak sublime-text code ripgrep	zsh exa git-credential-libsecret terminator cronie

# Install gcc, make, g++, etc...
sudo dnf group install -y "C Development Tools and Libraries"

# Configure the Flathub repo and install some flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install discord spotify org.gnome.Extensions com.leinardi.gwe org.videolan.VLC

# Installations that needs downloads
cd ~/Downloads 

# Install Gnome Tray Icons Extension
[ -d ~/.local/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com ] || $(wget https://extensions.gnome.org/extension-data/tray-iconszhangkaizhao.com.v6.shell-extension.zip && gnome-extensions install tray-iconszhangkaizhao.com.v6.shell-extension.zip)

# Clear ~/Downloads directory and return to the actual $USER home directory
rm -rf *
cd ~

