# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                  .zshrc                                   ║
# ║                         Zsh Configuration File                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# 🌍 Environment Setup
# Homebrew initialization (Apple Silicon). Also seeds FPATH with
# ${HOMEBREW_PREFIX}/share/zsh/site-functions, which is where `pure` lives.
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export HOMEBREW_NO_ENV_HINTS=1        # Silence brew's "hint:" chatter
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1  # Cleanup is handled explicitly by `clean`

# Locale — /etc/zprofile only sets C.UTF-8, which breaks sorting and some TUIs
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# Editor / pager
export EDITOR="${EDITOR:-nvim}"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="-FiRX"                   # Quit-if-one-screen, smart-case, colors, no clear
export MANPAGER="less -R"

# 🛤️ Paths
# Tool roots. HOMEBREW_PREFIX is exported by `brew shellenv` above; the fallback
# keeps this correct if brew is missing, and portable to Intel (/usr/local).
# These are plain shell variables — the tools that need them export their own
# copy, and GOPATH is already exported from ~/.zshenv for non-interactive use.
: ${HOMEBREW_PREFIX:=/opt/homebrew}
: ${GOPATH:=${HOME}/go}

# zplug: the Homebrew formula stores its cloned plugin repos under the formula
# prefix, so `brew upgrade zplug` wipes them — `update` runs `zplug install` to
# heal that. zplug's core.zsh re-declares this as `typeset -gx`, so setting the
# plain variable here is enough. ${ZPLUG_HOME}/bin is added to path by zplug.
: ${ZPLUG_HOME:=${HOMEBREW_PREFIX}/opt/zplug}

typeset -U path PATH fpath FPATH
path=(
    # Homebrew
    ${HOMEBREW_PREFIX}/bin
    ${HOMEBREW_PREFIX}/sbin

    # PostgreSQL
    ${HOMEBREW_PREFIX}/opt/postgresql@17/bin

    # Go
    ${GOPATH}/bin

    # Ruby
    ${HOME}/.rbenv/shims

    # Curl
    ${HOMEBREW_PREFIX}/opt/curl/bin

    # Java
    ${HOMEBREW_PREFIX}/opt/openjdk/bin

    # Local bin
    ${HOME}/.local/bin

    # System paths
    $path
)
export PATH

# ⚙️ Zsh Options
# History configuration
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
unsetopt SHARE_HISTORY           # Do not share history between sessions (keep per-tab)
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file
setopt HIST_REDUCE_BLANKS        # Strip superfluous whitespace before recording
setopt HIST_VERIFY               # Do not execute immediately upon history expansion
setopt APPEND_HISTORY            # Append to history file
unsetopt INC_APPEND_HISTORY      # Do not write to history file immediately (keep in memory)
setopt AUTO_CD                   # Change directory without typing cd
setopt AUTO_PUSHD                # Push directories onto the directory stack
setopt PUSHD_IGNORE_DUPS         # Do not push multiple copies of the same directory
setopt PUSHD_SILENT              # Don't print the directory stack after pushd/popd
setopt PUSHD_MINUS               # Exchange the meanings of '+' and '-'
setopt NO_BEEP                   # Don't beep on errors
setopt EXTENDED_GLOB             # Enable #, ~ and ^ glob operators
setopt NUMERIC_GLOB_SORT         # Sort globs numerically when they contain numbers
setopt INTERACTIVE_COMMENTS      # Allow # comments in interactive shells
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word
setopt PATH_DIRS                 # Perform path search even on command names with slashes
setopt AUTO_MENU                 # Show completion menu on a successive tab press
setopt AUTO_LIST                 # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH          # If completed parameter is a directory, add a trailing slash
unsetopt MENU_COMPLETE           # Do not autoselect the first completion entry (AUTO_MENU handles cycling)
unsetopt FLOW_CONTROL            # Disable start/stop characters in shell editor
unsetopt CORRECT                 # Disable command correction
unsetopt CORRECT_ALL             # Disable all arguments correction

typeset -g ZSH_CACHE_DIR="${HOME}/.zsh/cache"
typeset -g ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${ZSH_VERSION}"
[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"

# ⌨️ zsh-vi-mode Configuration
# Must be defined before the plugin loads.
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

# zsh-vi-mode takes over the keymap at init, so every custom bindkey has to be
# (re)applied here, after it finishes.
function zvm_after_init() {
    [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

    # zsh-autosuggestions
    bindkey '^l' autosuggest-accept
    bindkey '^ ' autosuggest-execute

    # History substring search
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
}

# 🔌 Plugin Manager
# ZPLUG_HOME is set in the Paths section above.
if [[ -f "${ZPLUG_HOME}/init.zsh" ]]; then
    source "${ZPLUG_HOME}/init.zsh"

    zplug "supercrabtree/k"
    zplug "jeffreytse/zsh-vi-mode"
    zplug "b4b4r07/enhancd", use:init.sh
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-syntax-highlighting", defer:3

    if ! zplug check; then
        printf "zplug: missing plugins. Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi

    zplug load
fi

# zsh-autosuggestions tuning (set after load so the plugin's defaults are known)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20        # Skip suggestions for very long lines
ZSH_AUTOSUGGEST_MANUAL_REBIND=1           # Don't re-bind widgets on every prompt

# 🔧 Completion System
# Runs *after* zplug load so zsh-completions and brew's site-functions are on
# fpath. The dump is regenerated at most once a day; every other start uses -C
# (skip the security audit) for a fast path.
autoload -Uz compinit
if [[ -n ${ZSH_COMPDUMP}(#qN.mh-24) ]]; then
    compinit -C -d "${ZSH_COMPDUMP}"
else
    compinit -i -d "${ZSH_COMPDUMP}"
    # Compile the dump in the background; saves ~20ms on subsequent starts
    { zcompile -R -- "${ZSH_COMPDUMP}" } &!
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
[[ -n "${LS_COLORS:-}" ]] && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# 💎 Ruby
# Shims are already on PATH above and completions come from brew's
# site-functions, so `rbenv init` would only add a ~40ms subprocess to every
# shell. Inline the one thing it actually provides: the wrapper that lets
# `rbenv shell` / `rbenv rehash` mutate the current shell instead of a child.
export RBENV_SHELL=zsh
rbenv() {
    local command="${1:-}"
    (( $# > 0 )) && shift
    case "$command" in
        rehash|shell) eval "$(command rbenv "sh-$command" "$@")" ;;
        *)            command rbenv "$command" "$@" ;;
    esac
}

# 🎨 Prompt
# Pure prompt - minimal and fast (provided by the `pure` Homebrew formula)
autoload -Uz promptinit && promptinit
prompt pure

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
alias duh="du -h -d 0 *(N)"        # List folder sizes (nullglob: no error when empty)
alias duf="du -sh *(N) | sort -h"  # List folder sizes sorted

# Python
alias python="python3"
alias pip="uv pip"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Others
alias c="clear"
if command -v ggrep &> /dev/null; then
    alias grep="ggrep --color=auto"
fi
alias myip="curl -fsSL https://api.ipify.org && echo"
alias flush="dscacheutil -flushcache"    # Flush your dns cache
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print the path
alias reload="exec ${SHELL} -l"          # Reload shell

# 🧹 System Maintenance
_hdr() {
    echo "╔═══════════════════════════════════════════════════════════════════╗"
    printf "║ %-65s ║\n" "$1"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
    echo
}

# True when $1 resolves to a binary inside the Homebrew prefix, i.e. the tool
# is package-manager-managed and must not self-update.
_brew_managed() {
    local bin
    bin="$(command -v "$1" 2>/dev/null)" || return 1
    [[ "$bin" == "${HOMEBREW_PREFIX:-/opt/homebrew}"/* ]]
}

# clean [--deep]
#   --deep also purges the Go module cache (forces a full re-download).
clean() {
    local deep=0
    [[ "$1" == "--deep" || "$1" == "-d" ]] && deep=1

    _hdr "SYSTEM CLEANUP"

    echo "🍺 Homebrew"
    brew cleanup --prune=all
    brew autoremove
    rm -rf "$(brew --cache)"
    echo "✓ Homebrew cleaned"
    echo

    echo "🐚 Zsh"
    if command -v zplug &> /dev/null; then
        zplug clean --force
    fi
    rm -rf "${ZSH_CACHE_DIR}" ~/.zcompdump* ~/.zsh_sessions
    mkdir -p "${ZSH_CACHE_DIR}"
    compinit -i -d "${ZSH_COMPDUMP}"
    echo "✓ Zsh caches cleaned and completion dump rebuilt"
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
    if command -v poetry &> /dev/null; then
        poetry cache clear pypi --all -n 2>/dev/null || true
        echo "✓ poetry cache cleaned"
    fi
    echo

    echo "🐹 Go"
    if command -v go &> /dev/null; then
        go clean -cache
        go clean -testcache
        if (( deep )); then
            go clean -modcache
            echo "✓ Go build, test and module caches cleaned"
        else
            echo "✓ Go build and test caches cleaned (use 'clean --deep' for -modcache)"
        fi
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

    _hdr "CLEANUP COMPLETED"
}

update() {
    _hdr "SYSTEM UPDATE"

    echo "🍺 Homebrew"
    brew update
    brew upgrade
    brew upgrade --cask --greedy
    brew cleanup --prune=all
    echo "✓ Homebrew updated"
    echo

    echo "🐚 Zsh Plugins"
    if command -v zplug &> /dev/null; then
        # ZPLUG_HOME lives in the Cellar, so a zplug upgrade above may have
        # removed repos/ — reinstall before updating.
        zplug install
        zplug update
    fi
    rm -f "${ZSH_COMPDUMP}" "${ZSH_COMPDUMP}.zwc" ~/.zcompdump*
    compinit -i -d "${ZSH_COMPDUMP}"
    echo "✓ Zsh plugins updated"
    echo

    echo "📦 Node.js (via Homebrew)"
    if command -v npm &> /dev/null; then
        npm install -g npm@latest
        npm update -g
        echo "✓ npm and global packages updated"
    fi
    echo

    echo "🐍 Python (via Homebrew)"
    if command -v uv &> /dev/null; then
        if _brew_managed uv; then
            echo "• uv is Homebrew-managed — upgraded by 'brew upgrade'; skipping 'uv self update'"
        else
            uv self update
            echo "✓ uv self updated"
        fi
        uv tool upgrade --all 2>/dev/null || true
        echo "✓ uv tools upgraded"
    fi
    if command -v pipx &> /dev/null; then
        pipx upgrade-all --include-injected
        echo "✓ pipx packages upgraded"
    fi
    echo "✓ Python updated via Homebrew"
    echo

    echo "🐹 Go (via Homebrew)"
    echo "✓ Go updated via Homebrew"
    echo

    echo "💎 Ruby (via Homebrew)"
    if command -v rbenv &> /dev/null; then
        rbenv rehash
        echo "✓ rbenv rehashed"
    fi
    echo "✓ Ruby updated via Homebrew"
    echo

    echo "🔧 System Maintenance"
    # Needs sudo for system-level packages; keep stderr visible so failures show.
    softwareupdate --all --install || true
    if command -v mas &> /dev/null; then
        mas upgrade
        echo "✓ App Store apps updated"
    fi
    echo "✓ System maintenance completed"
    echo

    echo "🩺 Homebrew Doctor"
    brew doctor || true
    echo

    _hdr "UPDATE COMPLETED"
}
