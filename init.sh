# Dotfiles kickstart
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~
ln -sv ~/.dotfiles/scripts ~/.scripts

mkdir ~/.config
mkdir ~/.config/nvim

ln -sv ~/.dotfiles/lsp ~/.config/lsp
ln -sv ~/.dotfiles/kitty ~/.config/kitty

ln -sv ~/.dotfiles/nvim/init.lua ~/.config/nvim
ln -sv ~/.dotfiles/nvim/lua ~/.config/nvim
