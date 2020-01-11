# Dotfiles kickstart

ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.tmux.conf ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore ~

ln -sv ~/.dotfiles/scripts ~/.scripts

ln -sv ~/.dotfiles/nvim/init.vim ~/.config/nvim
ln -sv ~/.dotfiles/ranger ~/.config/ranger

ln -sv ~/.dotfiles/ctags ~/.ctags.d
