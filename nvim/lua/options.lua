vim.opt.fileencoding = "utf-8"

-- Backup, undo, swap options
local home = vim.fn.stdpath("config")

vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true

vim.opt.backupdir = home .. "/tmp/dir_backup/"
vim.opt.directory = home .. "/tmp/dir_swap/," .. vim.o.directory
vim.opt.undodir = home .. "/tmp/dir_undo/"

vim.opt.lazyredraw = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 0

vim.opt.path = ".,,**"
vim.opt.errorformat = vim.o.errorformat .. ",%f,"
vim.opt.clipboard = "unnamedplus"

-- Search and replace
vim.opt.gdefault = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --" -- use rg instead of grep

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
vim.opt.hidden = true
vim.opt.pumheight = 10

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.ruler = false
vim.opt.signcolumn = "yes:2"

vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 1

vim.opt.laststatus = 2
vim.opt.showtabline = 2

vim.opt.showcmd = false
vim.opt.showmode = false

vim.opt.colorcolumn = "80"
vim.opt.linespace = 1
vim.opt.linebreak = true
vim.opt.scrolloff = 5

vim.opt.foldlevel = 1
vim.opt.foldmethod = "indent"

vim.opt.joinspaces = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true

-- Interface options
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.shortmess = vim.o.shortmess .. "c"

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
