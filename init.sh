# Dotfiles kickstart
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.npmrc ~
ln -sv ~/.dotfiles/.psqlrc ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~
ln -sv ~/.dotfiles/scripts ~/.scripts

mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/pgcli

ln -sv ~/.dotfiles/pgcli/config ~/.config/pgcli/config
ln -sv ~/.dotfiles/lsp ~/.config/lsp
ln -sv ~/.dotfiles/bat ~/.config/bat
ln -sv ~/.dotfiles/ghostty ~/.config/ghostty 

ln -sv ~/.dotfiles/nvim/init.lua ~/.config/nvim
ln -sv ~/.dotfiles/nvim/.luarc.json ~/.config/nvim
ln -sv ~/.dotfiles/nvim/lua ~/.config/nvim
