# General

# Paths
eval $(/opt/homebrew/bin/brew shellenv)
fpath+=($HOME/.zsh/pure)
path=(
    # PostgreSQL
    /opt/homebrew/opt/postgresql@16/bin

    # Go
    $GOPATH/bin
    $(go env GOPATH)/bin

    # Ruby
    $HOME/.rbenv/shims

    # Curl
    /opt/homebrew/opt/curl/bin

    $path
) 

# Pure ZSH prompt
autoload -U promptinit; promptinit
prompt pure

# Zsh Plugin Manager
source $ZPLUG_HOME/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "Licheam/zsh-ask"
zplug "supercrabtree/k"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Key Bindings

# zsh-vi-mode
bindkey -v
bindkey -M viins "jj" vi-cmd-mode

# zsh-autosuggestions
bindkey "^l" autosuggest-accept
bindkey "^ " autosuggest-execute

# Aliases
alias code="nvim"
alias session-code="kitty --session ~/.config/kitty/startup-code.conf"
alias session-photoday="kitty --session ~/.config/kitty/startup-photoday.conf"

# Copy
alias rcp="rsync --archive --human-readable --progress --verbose --whole-file"
alias rscp="rsync --archive --checksum --compress --human-readable --itemize-changes --rsh=ssh --stats --verbose"

# Some directory listing with colors
alias sl="ls"
alias ls="ls -G"        # Compact view, show colors
alias la="ls -AF"       # Compact view, show hidden
alias ll="ls -alh"
alias l="ls -a"
alias l1="ls -1"

alias t="tree -LC 1"
alias tt="tree -LC 2"
alias ttt="tree -LC 3"
alias duh="du -h -d 0 [^.]*" # List folder sizes

alias python="python3"
alias pip="pip3"

# Others
alias c="clear"
alias grep="grep --color"
alias myip="curl http://myip.dnsomatic.com && echo """
alias flush="dscacheutil -flushcache"    # Flush your dns cache
alias path="echo $PATH | tr -s ":" "\n"" # Pretty print the path

alias clean="
    echo Bash... &&
    brew cleanup &&
    zplug clean --force &&
    zplug clear &&
    dscacheutil -flushcache && 
    echo Done &&

    echo TypeScript... &&
    npm cache --force clean &&
    npm list -g --depth 0 &&
    echo Done &&

    echo Python &&
    echo &&

    echo Ruby &&
    echo &&

    echo Go &&
    echo &&

    echo Rust &&
    echo"

alias update="
    echo Bash &&
    brew update &&
    brew upgrade &&
    brew update --force &&
    brew doctor &&
    zplug update --force &&
    echo &&

    echo TypeScript &&
    npm install -g npm@latest &&
    npm update -g &&
    echo Done &&

    echo Python &&
    python -m pip install --upgrade pip --break-system-packages &&
    pip list --outdated | tail -n +3 | cut -d' ' -f 1 | xargs -n 1 pip install --upgrade
    echo Done
    "
