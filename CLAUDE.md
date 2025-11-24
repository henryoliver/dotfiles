# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is Henry Oliver's personal dotfiles repository for macOS development environment configuration. The repository uses symbolic linking to deploy configuration files from this central location to their appropriate system locations.

## Setup and Installation

### Initial Setup
Run the initialization script to create all necessary symbolic links:
```bash
./init.sh
```

This script creates symlinks for:
- Shell configuration (.zshrc)
- Git configuration (.gitconfig, .gitignore)
- Terminal emulator configs (ghostty, kitty)
- Editor configuration (nvim)
- Database CLI tools (.npmrc, .psqlrc)
- LSP and formatter configs
- Helper scripts

### System Maintenance Commands
Available via .zshrc aliases:
- `update` - Comprehensive system update (Homebrew, zsh plugins, Node, Python/uv, Go, Ruby, macOS)
- `clean` - System cleanup (caches for Homebrew, zsh, DNS, npm, uv/pip/pipx/poetry, Go, Ruby/bundler)

## Architecture

### Neovim Configuration
Located in `nvim/` directory with modular Lua architecture:

**Entry Point**: `nvim/init.lua`
- Loads modules in order: opts → lazy → keys → auto

**Core Configuration** (`nvim/lua/config/`):
- `opts.lua` - Editor options (indentation, display, search, folding, performance)
- `lazy.lua` - Lazy.nvim plugin manager setup with performance optimizations
- `keys.lua` - Core keybindings (jj for escape, B/E for line start/end, leader-based saves)
- `auto.lua` - Autocommands and automatic behaviors

**Plugin System** (`nvim/lua/plugins/`):
- Each plugin has its own file (e.g., `lsp.lua`, `telescope.lua`, `cmp.lua`)
- Lazy-loaded by default via lazy.nvim
- Nord colorscheme as primary theme
- Key plugins: LSP (via Mason), Telescope (fuzzy finder), nvim-cmp (completion), noice.ui, codecompanion (AI integration)

**Configuration Patterns**:
- Leader key is Space
- Backup/swap/undo files stored in `~/.local/share/nvim/{backup,swap,undo}/`
- Uses `//` suffix in directory paths for full path encoding (prevents filename collisions)
- Treesitter disabled for some built-ins (matchit, matchparen, netrw) to reduce overhead

### Shell Configuration
**Zsh Setup** (`.zshrc`):
- Uses zplug for plugin management
- Pure prompt for minimal, fast prompt
- Vi-mode enabled (jj to escape insert mode)
- History configured for per-tab isolation (no SHARE_HISTORY)

**Key Plugins**:
- zsh-vi-mode (with jj escape binding)
- zsh-autosuggestions (Ctrl-L to accept, Ctrl-Space to execute)
- zsh-syntax-highlighting
- zsh-history-substring-search (arrow keys or j/k in vi mode)
- enhancd (enhanced cd)
- k (better ls)

**Path Configuration**:
Priority order: Homebrew → PostgreSQL@17 → Go → rbenv → curl → local bin → system

### Git Configuration
Located in `.gitconfig`:
- Editor: nvim
- Diff/merge tool: vimdiff (nvim)
- Advanced merge conflict style: zdiff3
- Rerere enabled for reuse of recorded resolutions
- Auto-squash and auto-stash for rebases

**Custom Aliases**:
- `git ls` - Compact log with colors and formatting
- `git standup` - Yesterday's commits
- `git up` - Push current branch with tracking
- `git bam` - Delete local merged branches (uses `scripts/git.sh`)
- `git bamr` - Delete remote merged branches (uses `scripts/git.sh`)
- `git summary` - Weekly commit summary (uses `scripts/git.sh`)
- `git graph`, `graph1-4` - Various graph visualizations

### LSP and Formatter Configuration
Located in `lsp/` directory:
- `.editorconfig` - Cross-editor configuration
- `luacheckrc.lua` - Lua linting configuration
- `prettierrc.json` - JavaScript/TypeScript/JSON/CSS/HTML formatting
- `stylelintrc.json` - CSS linting
- `stylua.toml` - Lua formatting (symlinked to root as `.stylua.toml`)

### Terminal Emulators
- **ghostty**: Configuration in `ghostty/config`
- **kitty**: Configuration in `kitty/` directory (legacy, ghostty is preferred)

## Common Development Workflows

### Editing Neovim Configuration
1. Modify files in `nvim/lua/config/` or `nvim/lua/plugins/`
2. Changes take effect on next nvim restart, or reload with `:source $MYVIMRC`
3. Plugin changes may require `:Lazy sync`

### Adding New Zsh Plugin
1. Edit `.zshrc` and add `zplug "author/plugin-name"` in the plugins section
2. Run `zplug install` or restart shell with `reload` alias

### Updating Git Configuration
Edit `.gitconfig` directly - changes take effect immediately for new git operations.

### Adding New Dotfile
1. Add file/directory to repository
2. Update `init.sh` with appropriate symlink command
3. Run `./init.sh` to create symlink

## Key Customizations

### Neovim
- Leader: Space
- Insert mode escape: `jj`
- Visual mode toggle: `v`
- Line navigation: `B` (beginning), `E` (end)
- Save shortcuts: `<Leader>w` (current buffer), `<Leader>W` (all buffers)
- Relative line numbers toggle: `gl`
- Command height: 0 (floating command line)
- Status line: disabled (using plugin-based solution)

### Zsh
- Vi-mode with `jj` escape in insert mode
- Auto-cd without typing `cd`
- Auto-pushd for directory stack
- History: 100k entries, per-tab isolation
- Editor alias: `code` and `vim` both point to `nvim`
- Python: `python` → `python3`, `pip` → `uv`

### Git
- Histogram diff algorithm
- Auto-setup remote on push
- Prune on fetch
- Force-with-lease for safer force pushes
- Verbose commits
- Auto-squash rebases

## File Organization Rules

- Neovim plugins: One file per plugin in `nvim/lua/plugins/`
- Config modules: Separate concerns in `nvim/lua/config/`
- LSP configs: Centralized in `lsp/` for reuse across tools
- Shell scripts: Place in `scripts/` directory
- Terminal configs: Separate directory per terminal emulator

## Development Environment

- **OS**: macOS (Darwin)
- **Shell**: Zsh with zplug
- **Editor**: Neovim with lazy.nvim
- **Package Manager**: Homebrew
- **Languages**: Go, Ruby (rbenv), Python (uv), Node.js
- **Terminal**: ghostty (primary), kitty (legacy)
- **Version Control**: Git with custom workflow scripts
