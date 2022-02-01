vim.bo.fileencoding = 'utf-8'

-- Backup, undo, swap options
local home = vim.fn.stdpath('config')

vim.o.backup = true
vim.o.writebackup = true
vim.bo.undofile = true

vim.o.backupdir = home .. '/tmp/dir_backup/'
vim.o.directory = home .. '/tmp/dir_swap/,' .. vim.o.directory
vim.o.undodir = home .. '/tmp/dir_undo/'

vim.o.lazyredraw = true
vim.o.updatetime = 300
vim.o.timeoutlen = 400
vim.o.ttimeoutlen = 0

vim.o.path = '.,,**'
vim.o.errorformat = vim.o.errorformat .. ',%f,'
vim.o.clipboard = 'unnamedplus'

-- Search and replace
vim.o.magic = true
vim.o.gdefault = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.grepprg = 'rg --hidden --vimgrep --smart-case --' -- use rg instead of grep

vim.o.incsearch = true
vim.o.inccommand = 'split'

vim.o.wildignorecase = true
vim.o.wildignore = [[
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
vim.bo.tabstop = 4
vim.wo.wrap = false
vim.wo.conceallevel = 0
vim.bo.expandtab = true
vim.bo.smartindent = true

vim.wo.list = true
vim.wo.listchars = { tab = '··', trail = '·' }

-- Presentation
vim.o.hidden = true
vim.o.pumheight = 10

vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline = true
vim.wo.signcolumn = 'number'

vim.o.ruler = false

vim.o.cmdheight = 1
vim.o.cmdwinheight = 1

vim.o.laststatus = 2
vim.o.showtabline = 2

vim.o.showcmd = false
vim.o.showmode = false

vim.o.colorcolumn = 80
vim.wo.wrap = true
vim.o.linespace = 0
vim.wo.linebreak = true

vim.o.foldenable = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.joinspaces = false

vim.o.splitbelow = true
vim.o.splitright = true

-- Interface options
vim.o.termguicolors = true
vim.o.completeopt = 'menu,menuone,noselect,noinsert'
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- Providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
