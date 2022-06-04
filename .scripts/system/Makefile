# exec this file with "sudo make"

DNF_INSTALL = dnf install -y
DNF_PACKAGES = git htop neofetch neovim git-credential-libsecret zsh wget gpg curl

install: packages external-packages flathub docker

packages:
	$(DNF_INSTALL) $(DNF_PACKAGES)

external-packages:
	./install-chrome.sh
	./install-code.sh
	./install-brave.sh

flathub:
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

docker:
	./install-docker.sh
