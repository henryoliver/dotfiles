vim.g.mapleader = " "

-- Backup, undo, swap options
local home = vim.fn.stdpath("config")

vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.backupdir = home .. "/tmp/dir_backup/"
vim.opt.directory = home .. "/tmp/dir_swap/," .. vim.o.directory
vim.opt.undodir = home .. "/tmp/dir_undo/"

vim.opt.lazyredraw = true
vim.opt.updatetime = 100
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

vim.opt.path = ".,,**"
vim.opt.errorformat = vim.o.errorformat .. ",%f,"
vim.opt.clipboard = "unnamedplus"

-- Search and replace
vim.opt.gdefault = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --" -- use rg instead of grep

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.wildignorecase = true
vim.opt.wildignore = [[
    .git,.hg,.svn
    *.aux,*.out,*.toc
    *.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
    *.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
    *.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
    *.mp3,*.oga,*.ogg,*.wav,*.flac
    *.eot,*.otf,*.ttf,*.woff
    *.doc,*.pdf,*.cbr,*.cbz
    *.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
    *.swp,.lock,.DS_Store,._*
    */tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]

-- White space
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.list = true
vim.opt.listchars = [[tab:··,trail:·]]

-- Presentation
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.hidden = true
vim.opt.pumheight = 10
vim.opt.complete = {}

vim.opt.number = true
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.relativenumber = true

vim.opt.ruler = false
vim.opt.cursorline = true

vim.opt.more = false -- don't pause listing when screen is filled
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 1

vim.opt.laststatus = 2
vim.opt.showtabline = 0

vim.opt.showcmd = false
vim.opt.showmode = false

vim.opt.wrap = true -- display lines as one long line
vim.opt.colorcolumn = "80"
vim.opt.linespace = 1
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "0" -- No column signs next to line numbers
vim.opt.foldlevelstart = 1

vim.opt.joinspaces = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true

vim.opt.fillchars:append({ eob = " ", fold = " ", foldopen = " ", foldsep = " ", foldclose = " ", diff = "╱" })

-- Interface options
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.mouse = "a"           -- allow the mouse to be used in neovim
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
