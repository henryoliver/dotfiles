local icons = require("config.icons")

vim.g.mapleader = " "

-- Backup, undo, swap options
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.swapfile = false

local home = vim.fn.stdpath("config")
vim.opt.backupdir = home .. "/tmp/dir_backup/"
vim.opt.directory = home .. "/tmp/dir_swap/," .. vim.o.directory
vim.opt.undodir = home .. "/tmp/dir_undo/"

vim.opt.lazyredraw = false
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
vim.opt.listchars = { tab = icons.layout.tab .. " " }

-- Presentation
vim.opt.hidden = true
vim.opt.pumheight = 20
vim.opt.complete = {}

vim.opt.number = true
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.relativenumber = true
vim.opt.cursorlineopt:append("number", "screenline")

vim.opt.ruler = true
vim.opt.cursorline = true

vim.opt.more = false -- don't pause listing when screen is filled
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 1

vim.opt.laststatus = 0
vim.opt.statusline = "%#Normal#" .. "⊱ ──────────── {⋆⌘⋆} ──────────── ⊰" .. "%="
vim.opt.showtabline = 0

vim.opt.showcmd = false
vim.opt.showmode = false

vim.opt.wrap = true -- display lines as one long line
vim.opt.colorcolumn = "80"
vim.opt.linespace = 1
vim.opt.linebreak = true
vim.opt.showbreak = icons.layout.wrap .. " "

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.foldcolumn = "0" -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.joinspaces = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false

vim.opt.fillchars:append({ eob = " ", fold = " ", foldopen = " ", foldsep = " ", foldclose = " ", diff = "╱" })

-- Interface options
vim.opt.wildmenu = true
vim.opt.confirm = false
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.shortmess:append("aIF")
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
