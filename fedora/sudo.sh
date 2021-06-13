# Add Sublime Text 4 repo
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Add VSCode repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Add RPMFusion repositories (Free/Non-free)
dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-34.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-34.noarch.rpm

# Install Google Chrome and Vivaldi
dnf in -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Install Google Chrome and Vivaldi
dnf in -y https://downloads.vivaldi.com/stable/vivaldi-stable-4.0.2312.27-1.x86_64.rpm

# Install packages
dnf in -y kitty neovim neofetch htop gnome-tweaks flatpak sublime-text code ripgrep	zsh exa git-credential-libsecret terminator
