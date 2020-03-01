# Dotfiles kickstart

ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.tmux.conf ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~

ln -sv ~/.dotfiles/scripts ~/.scripts

mkdir ~/.config/ranger && ln -sv ~/.dotfiles/ranger ~/.config/ranger
mkdir ~/.config/nvim && ln -sv ~/.dotfiles/nvim/init.vim ~/.config/nvim
mkdir ~/.config/alacritty && ln -sv ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

ln -sv ~/.dotfiles/ctags ~/.ctags.d
