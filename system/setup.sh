# setup script for ubuntu 22.04 minimal desktop

# install git and zsh
## sudo apt install git zsh curl neovim tmux

# setup repo folder
## mkdir ~/code

# pull dotfiles
## git clone https://github.com/v801/.dotfiles ~/code/.dotfiles

# symlink dotfiles
## ln -s ~/code/.dotfiles/.zsh_aliases ~/.zsh_aliases
## ln -s ~/code/.dotfiles/.zshrc ~/.zshrc
## ln -s ~/code/.dotfiles/.tmux.conf ~/.tmux.conf

# change users default bash shell to zsh
## chsh -s $(which zsh)

# setup vim from https://github.com/v801/neovim-config

echo "finish this setup script!"
