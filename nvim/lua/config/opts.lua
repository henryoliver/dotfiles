local icons = require("config.icons")
local opt = vim.opt

opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
opt.wildmenu = true

opt.swapfile = false
opt.undofile = true

opt.timeout = false
opt.updatetime = 400

opt.termguicolors = true
opt.confirm = false
opt.equalalways = false
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 2
opt.sidescrolloff = 2
opt.shortmess:append("aIF")

opt.list = true
opt.listchars = { tab = "··", trail = "·" }
--opt.fillchars:append({ eob = " ", fold =  " ", foldopen = " ", foldsep = " ", foldclose = " " })
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

opt.laststatus = 0
local statusline_ascii = "⊱ ────────────────── {⋆⌘⋆} ────────────────── ⊰"
vim.opt.statusline = "%#Normal#" .. statusline_ascii .. "%="

opt.ruler = true
opt.colorcolumn = "+1"
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.cursorlineopt:append("number", "screenline")

opt.linebreak = true
opt.showbreak = icons.layout.wrap .. " "

opt.ignorecase = true
opt.smartcase = true
opt.grepprg = "rg --hidden --vimgrep --smart-case --" -- use rg instead of grep

opt.pumheight = 20
opt.complete = {}

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 2
opt.foldenable = true

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
