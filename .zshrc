# General
export EDITOR="nvim"

# Manually export others ENVs variables
source ~/.config/.envs

# Paths
case `uname` in
    Darwin)
        # commands for OS X go here
        path=("/usr/local/bin" "/usr/local/sbin" $path)
    ;;
    Linux)
        # commands for Linux go here
        path+=("$HOME/.npm-global/bin")
    ;;
esac

# Pure (pretty, minimal and fast ZSH prompt)
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
zplug "supercrabtree/k"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

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

# zsh-vi-mode
bindkey -v
bindkey -M viins "jj" vi-cmd-mode

# zsh-autosuggestions
bindkey "^l" autosuggest-accept
bindkey "^ " autosuggest-execute

# Aliases
alias code="nvim"
alias session-photoday="kitty --session ~/.config/kitty/startup-photoday.conf"
alias session-london="kitty --session ~/.config/kitty/startup-london.conf"

alias python="python3"
alias pip="pip3"

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

# Others
alias c="clear"
alias grep="grep --color"
alias myip="curl http://myip.dnsomatic.com && echo """
alias flush="dscacheutil -flushcache"    # Flush your dns cache
alias path="echo $PATH | tr -s ":" "\n"" # Pretty print the path

case `uname` in
    Darwin)
        # commands for OS X go here
        alias clean="brew cleanup &&
            zplug clean --force &&
            zplug clear &&
            npm cache --force clean &&
            npm list -g --depth 0 &&
            dscacheutil -flushcache"

        alias update="brew update &&
            brew upgrade &&
            brew update --all &&
            brew doctor &&
            npm install -g npm@latest &&
            npm update -g &&
            curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin &&
            zplug update --force &&
            pip install --upgrade pip &&
            pip install --upgrade pynvim &&
            pip list --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
    ;;
    Linux)
        # commands for Linux go here
        alias clean="npm cache --force clean &&
            sudo apt autoremove &&
            sudo apt-get purge &&
            sudo apt-get autoremove &&
            sudo apt-get clean &&
            sudo apt-get autoclean"

        alias update="npm install -g npm@latest &&
            npm update -g &&
            sudo apt update &&
            sudo apt upgrade &&
            sudo apt full-upgrade &&
            sudo apt-get update &&
            sudo apt-get upgrade &&
            sudo apt-get dist-upgrade &&
            sudo apt-get dselect-upgrade &&
            sudo apt-get check"
    ;;
esac

export PATH="$PATH:/Users/henryoliver/.bin"
