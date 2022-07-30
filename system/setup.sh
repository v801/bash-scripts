# setup script for ubuntu 22.04 minimal desktop

# install curl git zsh neovim tmux bat
## sudo apt install curl git zsh neovim tmux bat

# install asdf
## git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# install asdf plugins
## asdf plugin add nodejs
## asdf plugin add golang
## asdf plugin add python
## asdf plugin add rust

# install latest from asdf plugins
## asdf install nodejs latest
## asdf global nodejs latest
##
## asdf install golang latest
## asdf global golang latest
##
## asdf install python latest
## asdf global python latest
##
## asdf install rust latest
## asdf global rust latest

# setup repo folder
## mkdir ~/code

# pull dotfiles
## git clone https://github.com/v801/.dotfiles ~/code/.dotfiles

# symlink dotfiles
## ln -s ~/code/.dotfiles/.zsh_aliases ~/.zsh_aliases
## ln -s ~/code/.dotfiles/.zshrc ~/.zshrc
## ln -s ~/code/.dotfiles/.tmux.conf ~/.tmux.conf

# symlink bat
## sudo ln -s batcat /usr/bin/bat

# change users default bash shell to zsh
## chsh -s $(which zsh)

# setup vim from https://github.com/v801/neovim-config

echo "finish this setup script!"
