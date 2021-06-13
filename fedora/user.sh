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

