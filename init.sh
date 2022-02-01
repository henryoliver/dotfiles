# Dotfiles kickstart
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.tmux.conf ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~
ln -sv ~/.dotfiles/scripts ~/.scripts

mkdir ~/.config
mkdir ~/.config/nvim

ln -sv ~/.dotfiles/bat ~/.config/bat
ln -sv ~/.dotfiles/lsp ~/.config/lsp
ln -sv ~/.dotfiles/kitty ~/.config/kitty
ln -sv ~/.dotfiles/ranger ~/.config/ranger
ln -sv ~/.dotfiles/nvim/init.vim ~/.config/nvim

