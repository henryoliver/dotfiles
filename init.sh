# Dotfiles kickstart
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.tmux.conf ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~

ln -sv ~/.dotfiles/scripts ~/.scripts

ln -sv ~/.dotfiles/ctags/ ~/.scripts

mkdir ~/.config

starship.toml

ln -sv ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim

mkdir ~/.config/ranger && ln -sv ~/.dotfiles/ranger ~/.config/ranger
mkdir ~/.config/nvim && ln -sv ~/.dotfiles/nvim/init.vim ~/.config/nvim
mkdir ~/.config/bat && ln -sv ~/.dotfiles/bat/config ~/.config/bat
