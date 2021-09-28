-- Plugins
-- {{{ -------------------------------------------------------------------------
require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- Themes
    use 'arcticicestudio/nord-vim'

    -- Language
    use 'folke/trouble.nvim' -- A pretty list for showing diagnostics, references...
    use 'folke/lsp-colors.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Completion
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/nvim-compe'
    use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms to neovim built-in lsp

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- Code display
    use 'andymass/vim-matchup' -- Highlight, navigate, and operate on sets of matching text

    -- Search
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'unblevable/quick-scope'
    use 'kevinhwang91/nvim-hlslens'
    use 'nvim-telescope/telescope.nvim'

    -- Integrations
    use 'TimUntersberger/neogit'
    use 'f-person/git-blame.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    use 'kevinhwang91/rnvimr' -- Ranger
    use 'kyazdani42/nvim-tree.lua' -- Explorer

    use 'editorconfig/editorconfig-vim'
    use { 'npxbr/glow.nvim', run = ':GlowInstall' } -- Markdown preview window

    -- Interface
    use 'mhinz/vim-startify'
    use 'kyazdani42/nvim-web-devicons'

    use 'akinsho/nvim-bufferline.lua'
    use { 'glepnir/galaxyline.nvim', branch = 'main' }

    use 'junegunn/goyo.vim' -- Distraction-free mode
    use 'psliwka/vim-smoothie'
    use 'gennaro-tedesco/nvim-peekup' -- Vim registers in floating window

    -- Commands
    use 'b3nj5m1n/kommentary'
    use 'blackcauldron7/surround.nvim'

    -- Other
    use 'turbio/bracey.vim' -- Live html, css, and javascript editing in vim
    use 'airblade/vim-rooter'
    use 'metakirby5/codi.vim' -- The interactive language scratchpad
end)

-- Disable some built-in plugins we don't want
local disabled_built_ins = { 'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip', 'netrwPlugin' }
for i = 1, 10 do vim.g['loaded_' .. disabled_built_ins[i]] = 1 end

-- Settings
-- {{{ -------------------------------------------------------------------------
vim.bo.fileencoding = 'utf-8'            -- The encoding written to file

-- Backup, undo, swap options
local home = vim.fn.stdpath 'config'    -- User configuration directory

vim.o.backup = true                     -- Set this option to enable backup
vim.o.writebackup = true                -- Set this option to write backup
vim.bo.undofile = true                   -- Set this option to have full undo power

vim.o.backupdir = home .. '/tmp/dir_backup/'                    -- Back up dir
vim.o.directory = home .. '/tmp/dir_swap/,' .. vim.o.directory  -- Swap file dir
vim.o.undodir = home .. '/tmp/dir_undo/'                        -- Undo dir

vim.o.lazyredraw = true                 -- Don't bother updating screen during macro playback
vim.o.updatetime = 300                  -- If this many milliseconds nothing is typed the swap file will be written to disk.
vim.o.timeoutlen = 600                  -- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.ttimeoutlen = 40                  -- Time in milliseconds to wait for a key code sequence to complete.

vim.o.path = '.,,**'                                            -- Set standard path
vim.o.errorformat = vim.o.errorformat .. ',%f,'                 -- Set fd errorformat
vim.o.clipboard = 'unnamed' .. vim.o.clipboard                  -- OS clipboard

-- Search and replace
vim.o.magic = true                      -- Use 'magic' patterns (extended regular expressions).
vim.o.gdefault = true                   -- Use 'g' flag by default with :s/foo/bar/.
vim.o.smartcase = true                  -- Use smart case unless the query has capital letters.
vim.o.ignorecase = true                 -- Make searching case insensitive

vim.o.incsearch = true                  -- Incremental search
vim.o.inccommand = 'split'              -- Icremental search to open preview window

vim.o.wildignorecase = true             -- Ignore case in wildignore
vim.o.wildignore = [[*.swp,*.bak,*.cache,*.min.*,**/dist/**,**/.git/**,*-lock.json,]] -- Wildignore paths

-- White space
vim.bo.tabstop = 4                       -- Set tab to equal 4 spaces.
vim.wo.wrap = false                      -- Wrap text
vim.wo.conceallevel = 0                  -- Text is shown normally
vim.bo.expandtab = true                 -- Converts tabs to spaces
vim.bo.smartindent = true               -- Makes indenting smart

vim.wo.list = true                                              -- Displays whitespace
vim.wo.listchars = { tab = '··', trail = '·' }                  -- Show leading whitespace

-- Presentation
vim.o.hidden = true                     -- Hide some buffers
vim.o.pumheight = 10                    -- Makes popup menu smaller

vim.wo.number = true                    -- Display numbers
vim.wo.relativenumber = true            -- Relative line numbers

vim.wo.cursorline = true                -- Show cursorline
vim.wo.signcolumn = 'number'            -- Merge signcolumn and numbers

vim.o.ruler = false                     -- Show the line and column number

vim.o.cmdheight = 1                     -- Number of screen lines to use for the command-line
vim.o.cmdwinheight = 1                  -- Number of screen lines to use for the command-line window

vim.o.laststatus = 2                    -- Always display statusline
vim.o.showtabline = 2                   -- Always show tabs

vim.o.showcmd = false                   -- Hide command in status line
vim.o.showmode = false                  -- Hide vim mode message on the last line

vim.o.cc = 80                           -- Highlight column at 80
vim.wo.wrap = true                       -- Enable line wrapping
vim.o.linespace = 0                     -- Set line-spacing to minimum
vim.wo.linebreak = true                  -- Wrap long lines at a character

vim.o.joinspaces = false                  -- Prevents inserting two spaces after punctuation on a join (J)

vim.o.splitbelow = true                 -- Split window to the bottom
vim.o.splitright = true                 -- Split window to right

-- Interface options
vim.o.termguicolors = true              -- True colors
vim.o.completeopt = 'menuone,noinsert,longest,noselect'     -- Autocomplete options
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.cmd('filetype plugin indent on')     -- Enable filetype detection
vim.cmd('syntax on')                     -- Enable syntax highlighting

-- Providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0

-- Plugins

-- Nord theme
vim.cmd('augroup nord-overrides')
    vim.cmd('autocmd!')
    vim.cmd('autocmd ColorScheme nord highlight Italic cterm=italic gui=italic')
    vim.cmd('autocmd ColorScheme nord highlight Folded cterm=italic,bold gui=italic,bold ctermbg=none guibg=none')
    vim.cmd('autocmd ColorScheme nord highlight Search ctermbg=3 ctermfg=0 guibg=#434C5E guifg=#D8DEE9')
vim.cmd('augroup END')

vim.g.nord_underline = 1
vim.g.nord_italic_comments = 1
vim.g.nord_uniform_diff_background = 1

vim.cmd('packadd! nord-vim')
vim.cmd('colorscheme nord')

-- Nvim Autopairs
require('nvim-autopairs').setup()

-- Nvim Hlslens
require('hlslens').setup({ calm_down = true })

-- Telescope
require('telescope').setup({ defaults = { prompt_position = 'top', sorting_strategy = 'ascending' } })

-- Gitsigns
require('gitsigns').setup()

-- Git Blame
vim.g.gitblame_enabled = 0

-- Ranger
vim.g.rnvimr_enable_ex = 1              -- Enable Ranger to replace builtin Netrw to be a file explorer.
vim.g.rnvimr_enable_bw = 1              -- Make Neovim automatically execute |bwipeout| to wipe out the buffers deleted by Ranger.

vim.g.rnvimr_enable_picker = 1          -- Enable Ranger to be hidden after picking a file.
vim.g.rnvimr_hide_gitignore = 1         -- Make Ranger to hide the files included in gitignore when show_hidden=False in Ranger.

vim.g.rnvimr_draw_border = 1            -- Using builtin curses in Ranger to draw a border for the floating window.
vim.g.rnvimr_border_attr = { fg = 14, bg = -1 }                     -- Change the border's color integer value is [-1, 255].
vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'    -- Set up only two columns

-- Customize the initial layout
vim.g.rnvimr_layout = { 
    style = 'minimal',
    relative = 'editor',
    row = math.floor(0.05 * vim.g.lines),
    col = math.floor(0.05 * vim.g.columns),
    height = math.floor(0.9 * vim.g.lines),
    width = math.floor(0.9 * vim.g.columns)
}

-- Startify
vim.g.startify_lists = {
    { type = 'files', header = {'Files'} },
    { type = 'dir', header = {'Current Directory ' .. vim.api.getcwd()} },
    { type = 'sessions', header = {'Sessions'} },
    { type = 'bookmarks', header= {'Bookmarks'} }
}

vim.g.startify_bookmarks = {
    { i = '~/.config/nvim/init.vim' },
    { z = '~/.zshrc' },
    '~/Projects'
}

vim.g.startify_enable_special = 0
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_session_delete_buffers = 1

-- Nvim Bufferline
require('bufferline').setup()

-- Galaxyline
require('galaxyline-settings')

-- Surround Nvim
require('surround').setup({})


















-- vim:foldmethod=marker
