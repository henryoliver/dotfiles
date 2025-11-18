-- Leader key (should be set in init.lua, but keeping for safety)
vim.g.mapleader = " "

-- Backup and recovery with better path handling
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.swapfile = true

-- Backup directories with automatic creation
-- local config_path = vim.fn.stdpath("config")
local data_path = vim.fn.stdpath("data") -- Better location for temporary files

-- Create directories if they don't exist
local backup_dirs = {
    backup = data_path .. "/backup",
    swap = data_path .. "/swap",
    undo = data_path .. "/undo",
}

for _, dir in pairs(backup_dirs) do
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

vim.opt.backupdir = { backup_dirs.backup .. "/" }
vim.opt.directory = { backup_dirs.swap .. "/" }
vim.opt.undodir = { backup_dirs.undo .. "/" }

-- Performance optimizations
vim.opt.lazyredraw = false -- Keep false for modern Neovim
vim.opt.updatetime = 250 -- More reasonable for modern systems
vim.opt.redrawtime = 1500
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- File search and clipboard
vim.opt.path = { ".", "**" }
vim.opt.clipboard = "unnamedplus"
vim.opt.errorformat:append("%f,")

-- Search behavior
vim.opt.gdefault = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"

-- Command completion
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wildignorecase = true
vim.opt.wildignore = {
    -- Version control
    ".git",
    ".hg",
    ".svn",
    -- Compiled files
    "*.aux",
    "*.out",
    "*.toc",
    "*.o",
    "*.obj",
    "*.exe",
    "*.dll",
    "*.manifest",
    "*.rbc",
    "*.class",
    -- Images
    "*.ai",
    "*.bmp",
    "*.gif",
    "*.ico",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.psd",
    "*.webp",
    -- Video
    "*.avi",
    "*.divx",
    "*.mp4",
    "*.webm",
    "*.mov",
    "*.m2ts",
    "*.mkv",
    "*.vob",
    "*.mpg",
    "*.mpeg",
    -- Audio
    "*.mp3",
    "*.oga",
    "*.ogg",
    "*.wav",
    "*.flac",
    -- Fonts
    "*.eot",
    "*.otf",
    "*.ttf",
    "*.woff",
    "*.woff2",
    -- Documents
    "*.doc",
    "*.docx",
    "*.pdf",
    "*.cbr",
    "*.cbz",
    -- Archives
    "*.zip",
    "*.tar.gz",
    "*.tar.bz2",
    "*.rar",
    "*.tar.xz",
    "*.kgb",
    -- Temporary/cache
    "*.swp",
    "*.swo",
    "*~",
    ".lock",
    ".DS_Store",
    "._*",
    "Thumbs.db",
    -- Directories
    "*/tmp/*",
    "**/node_modules/**",
    "**/target/**",
    "**/.terraform/**",
    "**/build/**",
    "**/dist/**",
    "**/.next/**",
    "**/.nuxt/**",
    -- Language specific
    "*.so",
    "*.pyc",
    "*.pyo",
    "__pycache__",
    "*.class",
    "*.jar",
}

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftround = true

-- Display
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "number", "screenline" }
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Command area (modern minimalist approach)
vim.opt.cmdheight = 0 -- Use floating command line
vim.opt.cmdwinheight = 5 -- Better height for command window
vim.opt.laststatus = 0 -- Global statusline (better for multiple windows)
vim.opt.showtabline = 0 -- Hide tabline (use bufferline plugin instead)
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.more = false

-- Text display
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindentopt = "shift:2,min:40,sbr" -- Better line breaking
vim.opt.showbreak = "↳ " -- Visual indicator for wrapped lines
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true

-- Folding configuration for preservation
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for better folding
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()" -- Better fold text
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 3
vim.opt.foldminlines = 1
vim.opt.foldnestmax = 10 -- Prevent excessive nesting
vim.opt.fillchars:append({
    fold = " ",
    foldsep = " ",
    foldopen = " ",
    foldclose = " ",
})

-- Windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false -- Don't auto-resize windows
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.winminheight = 1 -- Minimum window height

-- Buffers
vim.opt.hidden = true
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.autoread = true
vim.opt.autowrite = true -- Automatically save when switching buffers

-- Interface
vim.opt.confirm = true
vim.opt.termguicolors = true
vim.opt.pumheight = 10 -- Limit popup menu height

-- Special characters with better Unicode symbols
vim.opt.fillchars:append({
    eob = " ", -- End of buffer
    diff = "╱", -- Diff separator
    vert = "│", -- Vertical separator
    horiz = "─", -- Horizontal separator
    horizup = "┴", -- Horizontal up
    horizdown = "┬", -- Horizontal down
    vertleft = "┤", -- Vertical left
    vertright = "├", -- Vertical right
    verthoriz = "┼", -- Cross
})

vim.opt.listchars = {
    tab = "  ", -- Tab characters
    trail = "·", -- Trailing spaces
    extends = "›", -- Line extends beyond screen
    precedes = "‹", -- Line precedes screen
    nbsp = "⦸", -- Non-breaking space
    space = " ", -- Show spaces (optional, can be distracting)
}

-- Messages and info: Comprehensive message suppression
vim.opt.shortmess:append("sWAIcCqFT")
-- Additional flags:
-- T: Truncate other messages in the middle if too long

-- Performance and limits
vim.opt.synmaxcol = 300 -- Syntax highlighting limit
vim.opt.undolevels = 10000
vim.opt.history = 10000
vim.opt.maxmempattern = 20000 -- Increase pattern memory

-- Modern Neovim features
vim.opt.inccommand = "split" -- Live preview of substitute commands
vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" } -- Better completion with fuzzy matching (Neovim 0.11+)
vim.opt.virtualedit = { "block" } -- Allow cursor beyond end of line in visual block
vim.opt.messagesopt = "history:100" -- Configure message behavior (Neovim 0.11+)
vim.opt.winborder = "single" -- Default border for floating windows (Neovim 0.11+)

-- Session options for fold preservation
vim.opt.sessionoptions = {
    "buffers",
    "curdir",
    "folds", -- Preserve folds in sessions
    "help",
    "tabpages",
    "winsize",
    "winpos",
    "terminal",
    "localoptions", -- Preserve local options
}

-- View options for automatic fold saving/loading
vim.opt.viewoptions = {
    "folds",
    "cursor",
    "curdir",
    "slash",
    "unix",
}

-- Disable providers that aren't needed (keep Python3 if you use it)
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
-- Only disable python3_provider if you don't use Python plugins
vim.g.loaded_python3_provider = 0

-- Disable some built-in plugins for performance
vim.g.loaded_matchparen = 1 -- Use treesitter instead
vim.g.loaded_matchit = 1 -- Use treesitter instead
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1 -- Disable if using a file explorer plugin
