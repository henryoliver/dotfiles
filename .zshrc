# General
export EDITOR='nvim'

# Paths
path=('/usr/local/bin' '/usr/local/opt/ruby/bin' $path)
path+=('/usr/local/sbin')

# Pure
autoload -U promptinit; promptinit
prompt pure

# Zsh Plugin Manager

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug 'supercrabtree/k'
zplug 'b4b4r07/enhancd', use:init.sh

zplug 'b4b4r07/httpstat', as:command, use:'(*).sh', rename-to:'fetch'
zplug 'b4b4r07/pkill.sh', as:command, use:'pkill.sh', rename-to:'pkill'

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting'

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# Key Bindings

# Vi mode
bindkey -v

# Easy to escape
bindkey -M viins 'jj' vi-cmd-mode

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# zsh-autosuggestions
bindkey '^ ' autosuggest-execute
#autosuggest-accept: Accepts the current suggestion.
#autosuggest-execute: Accepts and executes the current suggestion.
#autosuggest-clear: Clears the current suggestion.
#autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
#autosuggest-disable: Disables suggestions.
#autosuggest-enable: Re-enables suggestions.
#autosuggest-toggle: Toggles between enabled/disabled suggestions.

# Aliases
alias code='nvim'

# Copy
alias rcp='rsync --archive --human-readable --progress --verbose --whole-file'
alias rscp='rsync --archive --checksum --compress --human-readable --itemize-changes --rsh=ssh --stats --verbose'

# Some directory listing with colors
alias sl='ls'
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -alh'
alias l='ls -a'
alias l1='ls -1'

alias t='tree -LC 1'
alias tt='tree -LC 2'
alias ttt='tree -LC 3'
alias duh='du -h -d 0 [^.]*' # List folder sizes

# Others
alias c='clear'
alias git='hub'
alias grep='grep --color'
alias myip='curl http://myip.dnsomatic.com && echo ""'
alias flush='dscacheutil -flushcache'    # Flush your dns cache
alias path="echo $PATH | tr -s ':' '\n'" # Pretty print the path

case `uname` in
  Darwin)
    # commands for OS X go here
    alias clean='brew cleanup &&
        npm cache clean --force &&
        zplug clean &&
        zplug clear &&
        dscacheutil -flushcache'

    alias update='brew update &&
        brew upgrade &&
        brew update --all &&
        npm update npm -g &&
        npm update -g --force &&
        npm install -g npm@latest &&
        zplug update &&
        brew doctor &&
        python3 -m pip install --upgrade pip &&
        python2 -m pip install --upgrade pip &&
        pip3 install --upgrade pip &&
        pip2 install --upgrade pip && 
        pip2 install --upgrade pynvim &&
        pip3 install --upgrade pynvim'
  ;;
  Linux)
    # commands for Linux go here
    alias clean='npm cache clean &&
        npm cache clean --force &&
        zplug clean &&
        zplug clear &&
        sudo apt autoremove && 
        sudo apt-get purge && 
        sudo apt-get autoremove && 
        sudo apt-get clean && 
        sudo apt-get autoclean'

    alias update='npm update npm -g &&
        npm update -g --force &&
        npm install -g npm@latest &&
        zplug update &&
        sudo apt update && 
        sudo apt upgrade && 
        sudo apt full-upgrade && 
        sudo apt-get update && 
        sudo apt-get upgrade && 
        sudo apt-get dist-upgrade && 
        sudo apt-get dselect-upgrade && 
        sudo apt-get check'
  ;;
esac
