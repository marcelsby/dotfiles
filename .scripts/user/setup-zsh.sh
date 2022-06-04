# change the current user shell to ZSH
chsh -s $(which zsh) $USER

# backup zshrc
mv $HOME/.zshrc $HOME/.zshrc.bak

# backup zshrc
mv $HOME/.zshrc $HOME/.zshrc.bak

# install oh-my-zsh
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# restore the previous backup
mv $HOME/.zshrc.bak $HOME/.zshrc 

# install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
