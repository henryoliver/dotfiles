# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                  .zshrc                                   ║
# ║                         Zsh Configuration File                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# 🌍 Environment Setup
# Homebrew initialization (Apple Silicon)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ⚙️ Zsh Options
# History configuration
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# Zsh options for better experience
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
unsetopt SHARE_HISTORY           # Do not share history between sessions (keep per-tab)
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file
setopt HIST_VERIFY               # Do not execute immediately upon history expansion
setopt APPEND_HISTORY            # Append to history file
unsetopt INC_APPEND_HISTORY      # Do not write to history file immediately (keep in memory)
setopt AUTO_CD                   # Change directory without typing cd
setopt AUTO_PUSHD                # Push directories onto the directory stack
setopt PUSHD_IGNORE_DUPS         # Do not push multiple copies of the same directory
setopt PUSHD_MINUS               # Exchange the meanings of '+' and '-'
setopt NO_BEEP                   # Don't beep on errors
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word
setopt PATH_DIRS                 # Perform path search even on command names with slashes
setopt AUTO_MENU                 # Show completion menu on a successive tab press
setopt AUTO_LIST                 # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH          # If completed parameter is a directory, add a trailing slash
setopt MENU_COMPLETE             # Do not autoselect the first completion entry
unsetopt FLOW_CONTROL            # Disable start/stop characters in shell editor
unsetopt CORRECT                 # Disable command correction
unsetopt CORRECT_ALL             # Disable all arguments correction

# 🔧 Completion System
# Initialize completion system
autoload -Uz compinit
compinit -C

# Completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# 🛤️ Paths
# Add to fpath
fpath+=($HOME/.zsh/pure)

# Configure PATH
typeset -U path PATH
path=(
    # Homebrew
    /opt/homebrew/bin
    /opt/homebrew/sbin

    # PostgreSQL
    /opt/homebrew/opt/postgresql@17/bin

    # Go
    ${GOPATH}/bin
    ${HOME}/go/bin

    # Ruby
    ${HOME}/.rbenv/shims

    # Curl
    /opt/homebrew/opt/curl/bin

    # Java
    /opt/homebrew/opt/openjdk/bin

    # Local bin
    ${HOME}/.local/bin

    # System paths
    $path
)

export PATH

# 🎨 Prompt
# Pure prompt - minimal and fast
autoload -U promptinit; promptinit
prompt pure

# ⌨️ zsh-vi-mode Configuration
# Configure zsh-vi-mode before it loads
function zvm_config() {
    # Use jj as escape key in insert mode
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

    # Automatically switch back to insert mode after command execution
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

    # Nord Theme Colors for zsh-vi-mode
    # Visual selection highlighting
    ZVM_VI_HIGHLIGHT_BACKGROUND=#5E81AC    # Nord10 (blue)
    ZVM_VI_HIGHLIGHT_FOREGROUND=#ECEFF4    # Nord6 (light gray)

    # Alternative Nord color options:
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#81A1C1  # Nord9 (lighter blue)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#88C0D0  # Nord8 (cyan)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#8FBCBB  # Nord7 (teal)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#BF616A  # Nord11 (red)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#A3BE8C  # Nord14 (green)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#EBCB8B  # Nord13 (yellow)
    # ZVM_VI_HIGHLIGHT_BACKGROUND=#B48EAD  # Nord15 (purple)

    # Cursor styles for different modes
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

# Define function to run after zsh-vi-mode init (for compatibility with other plugins)
function zvm_after_init() {
    # Load fzf if it exists
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # zsh-autosuggestions key bindings
    bindkey '^l' autosuggest-accept
    bindkey '^ ' autosuggest-execute

    # History search bindings
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    # Also bind for vi mode
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
}

# 🔌 Plugin Manager
# Zplug - A next-generation plugin manager for zsh
if [[ -f "${ZPLUG_HOME}/init.zsh" ]]; then
    source "${ZPLUG_HOME}/init.zsh"

    # Plugins
    zplug "supercrabtree/k"
    zplug "jeffreytse/zsh-vi-mode"
    zplug "b4b4r07/enhancd", use:init.sh
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-history-substring-search"

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Load plugins
    zplug load
fi

# 🎯 Key Bindings
# Note: Key bindings for zsh-autosuggestions and history search
# are now defined in the zvm_after_init function above to ensure
# compatibility with zsh-vi-mode

# 🔗 Aliases
# Editor
alias code="nvim"
alias vim="nvim"

# File operations
alias rename="f2"
alias rcp="rsync --archive --human-readable --progress --verbose --whole-file"
alias rscp="rsync --archive --checksum --compress --human-readable --itemize-changes --rsh=ssh --stats --verbose"

# Directory listing
alias sl="ls"
alias ls="ls -G"        # Compact view, show colors
alias la="ls -AF"       # Compact view, show hidden
alias ll="ls -alh"
alias l="ls -a"
alias l1="ls -1"

# Tree
alias t="tree -LC 1 --dirsfirst"
alias tt="tree -LC 2 --dirsfirst"
alias ttt="tree -LC 3 --dirsfirst"
alias tttt="tree -LC 4 --dirsfirst"

# Disk usage
alias duh="du -h -d 0 [^.]*" # List folder sizes
alias duf="du -sh * | sort -h" # List folder sizes sorted

# Python
alias python="python3"
alias pip="uv"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Others
alias c="clear"
alias grep="grep --color=auto"
alias myip="curl -s http://myip.dnsomatic.com && echo"
alias flush="dscacheutil -flushcache"    # Flush your dns cache
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print the path
alias reload="exec ${SHELL} -l"          # Reload shell

# 🧹 System Maintenance Aliases
alias clean='
    echo "╔═══════════════════════════════════════════════════════════════════╗"
    echo "║                        SYSTEM CLEANUP                             ║"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
    echo

    echo "🍺 Homebrew"
    brew cleanup --prune=all
    brew autoremove
    rm -rf $(brew --cache)
    echo "✓ Homebrew cleaned"
    echo

    echo "🐚 Zsh"
    zplug clean --force
    zplug clear
    rm -rf ~/.zcompdump*
    rm -rf ~/.zsh_sessions
    echo "✓ Zsh plugins cleaned"
    echo

    echo "🌐 DNS Cache"
    dscacheutil -flushcache
    sudo killall -HUP mDNSResponder 2>/dev/null || true
    echo "✓ DNS cache flushed"
    echo

    echo "📦 Node.js / npm"
    if command -v npm &> /dev/null; then
        npm cache clean --force
        npm cache verify
        echo "✓ npm cache cleaned"
    fi
    echo

    echo "🐍 Python"
    if command -v uv &> /dev/null; then
        uv cache clean
        echo "✓ uv cache cleaned"
    fi
    if command -v pip &> /dev/null; then
        pip cache purge 2>/dev/null || true
        echo "✓ pip cache cleaned"
    fi
    if command -v pipx &> /dev/null; then
        pipx upgrade-all --upgrade-injected
        echo "✓ pipx packages cleaned"
    fi
    if command -v poetry &> /dev/null; then
        poetry cache clear pypi --all -n 2>/dev/null || true
        echo "✓ poetry cache cleaned"
    fi
    echo

    echo "🐹 Go"
    if command -v go &> /dev/null; then
        go clean -cache
        go clean -testcache
        go clean -modcache
        echo "✓ Go cache cleaned"
    else
        echo "⚠ Go not found"
    fi
    echo

    echo "💎 Ruby"
    if command -v gem &> /dev/null; then
        gem cleanup
        echo "✓ Ruby gems cleaned"
    fi
    if command -v bundle &> /dev/null; then
        bundle clean --force 2>/dev/null || true
        echo "✓ Bundler cleaned"
    fi
    echo

    echo "╔═══════════════════════════════════════════════════════════════════╗"
    echo "║                    CLEANUP COMPLETED                              ║"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
'

alias update='
    echo "╔═══════════════════════════════════════════════════════════════════╗"
    echo "║                        SYSTEM UPDATE                              ║"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
    echo

    echo "🍺 Homebrew"
    brew update
    brew upgrade
    brew upgrade --cask --greedy
    brew cleanup --prune=all
    brew doctor
    echo "✓ Homebrew updated"
    echo

    echo "🐚 Zsh Plugins"
    zplug update
    # Rebuild zcompdump
    rm -f ~/.zcompdump && compinit
    echo "✓ Zsh plugins updated"
    echo

    echo "📦 Node.js (via Homebrew)"
    # Node.js is updated via brew upgrade above
    echo "✓ Node.js updated via Homebrew"
    echo

    echo "🐍 Python (via Homebrew)"
    # Python and tools are updated via brew upgrade above
    if command -v uv &> /dev/null; then
        uv self update
        echo "✓ uv self updated"
    fi
    echo "✓ Python updated via Homebrew"
    echo

    echo "🐹 Go (via Homebrew)"
    # Go is updated via brew upgrade above
    echo "✓ Go updated via Homebrew"
    echo

    echo "💎 Ruby (via Homebrew)"
    # Ruby is updated via brew upgrade above
    # Update rbenv if installed
    if command -v rbenv &> /dev/null; then
        rbenv rehash
        echo "✓ rbenv rehashed"
    fi
    echo "✓ Ruby updated via Homebrew"
    echo

    echo "🔧 System Maintenance"
    # Update macOS CLI tools
    softwareupdate --all --install --force 2>/dev/null || true
    # Update App Store apps if mas is installed via Homebrew
    if command -v mas &> /dev/null; then
        mas upgrade
        echo "✓ App Store apps updated"
    fi
    echo "✓ System maintenance completed"
    echo

    echo "╔═══════════════════════════════════════════════════════════════════╗"
    echo "║                    UPDATE COMPLETED                               ║"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
'
