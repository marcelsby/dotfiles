# exec this file with "sudo make"

APT_INSTALL = apt install -y
APT_PACKAGES = git htop neofetch neovim libsecret-1-0 libsecret-1-dev flatpak zsh wget gpg

install: packages external-packages flathub git-libsecret docker disable-snap

packages:
	$(APT_INSTALL) $(APT_PACKAGES)

external-packages:
	./install-chrome.sh
	./install-code.sh
	./install-brave.sh

flathub:
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

git-libsecret:
	cd /usr/share/doc/git/contrib/credential/libsecret && sudo make

docker: # https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
	./install-docker.sh

disable-snap:
	systemctl disable --now snapd snapd.socket

omni-gnome-terminal: 
	./omni-gnome-terminal.sh
