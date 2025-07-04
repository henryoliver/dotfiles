-- Leader key
vim.g.mapleader = " "

-- Backup and recovery
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.swapfile = true

-- Backup directories
local config_path = vim.fn.stdpath("config")
vim.opt.backupdir = { config_path .. "/tmp/dir_backup/" }
vim.opt.directory = { config_path .. "/tmp/dir_swap/", vim.o.directory }
vim.opt.undodir = { config_path .. "/tmp/dir_undo/" }

-- Performance
vim.opt.lazyredraw = false
vim.opt.updatetime = 100
vim.opt.redrawtime = 1500
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- File search
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
    ".git",
    ".hg",
    ".svn",
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
    "*.ai",
    "*.bmp",
    "*.gif",
    "*.ico",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.psd",
    "*.webp",
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
    "*.mp3",
    "*.oga",
    "*.ogg",
    "*.wav",
    "*.flac",
    "*.eot",
    "*.otf",
    "*.ttf",
    "*.woff",
    "*.doc",
    "*.pdf",
    "*.cbr",
    "*.cbz",
    "*.zip",
    "*.tar.gz",
    "*.tar.bz2",
    "*.rar",
    "*.tar.xz",
    "*.kgb",
    "*.swp",
    ".lock",
    ".DS_Store",
    "._*",
    "*/tmp/*",
    "*.so",
    "*.zip",
    "**/node_modules/**",
    "**/target/**",
    "**/.terraform/**",
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

-- Command area
vim.opt.cmdheight = 0
vim.opt.cmdwinheight = 1
vim.opt.laststatus = 0
vim.opt.showtabline = 0
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.more = false

-- Text display
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = ""
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 3
vim.opt.foldminlines = 1
vim.opt.fillchars = {
    fold = " ",
    foldsep = " ",
    foldopen = " ",
    foldclose = " ",
}

-- Windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true

-- Buffers
vim.opt.hidden = true
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.autoread = true

-- Interface
vim.opt.confirm = true
vim.opt.termguicolors = true

-- Special characters
vim.opt.fillchars:append({
    eob = " ",
    diff = " ",
    vert = "│",
    horiz = "",
})
vim.opt.listchars = {
    tab = " ",
    trail = "·",
    extends = "",
    precedes = "",
    nbsp = "",
}

-- Messages and info: Customize brevity of Neovim messages
vim.opt.shortmess:append("sWAIcCqFS") -- Append flags to suppress various messages
-- Breakdown of flags:
-- s: Don't show "search hit BOTTOM/TOP" messages
-- W: Don't show "written" or "[w]" when writing a file
-- A: Don't show "ATTENTION" message for existing swap file
-- I: Don't show intro message when starting Vim
-- c: Don't show ins-completion-menu messages
-- C: Don't show messages while scanning for ins-completion items
-- q: Use "recording" instead of "recording @a"
-- F: Don't show file info when editing a file
-- S: Don't show search count message when searching

-- Performance
vim.opt.synmaxcol = 300
vim.opt.undolevels = 10000
vim.opt.history = 10000

-- Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
