" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'shaunsingh/nord.nvim'

" Language
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'folke/trouble.nvim' " A pretty list for showing diagnostics, references...
Plug 'simrat39/symbols-outline.nvim' " A tree like sidebar view for symbols

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'windwp/nvim-spectre' " Search and replace
Plug 'nvim-telescope/telescope.nvim'
Plug 'rktjmp/highlight-current-n.nvim'

" Code display
Plug 'mhartington/formatter.nvim'

" Integrations
Plug 'tanvirtin/vgit.nvim'
Plug 'ruifm/gitlinker.nvim'
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

Plug 'kevinhwang91/rnvimr' " Ranger
Plug 'kyazdani42/nvim-tree.lua' " Explorer

Plug 'rizzatti/dash.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'MunifTanjim/nui.nvim'
Plug 'vuki656/package-info.nvim', { 'for': 'json' } " Display latest package versions as virtual text

" Interface
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }

" Commands
Plug 'b3nj5m1n/kommentary'
Plug 'blackcauldron7/surround.nvim'

" Other
Plug 'famiu/nvim-reload' " :Reload and :Restart commands.
Plug 'famiu/bufdelete.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/todo-comments.nvim' " Highlight and search TODO, HACK, BUG

" Initialize plugin system
call plug#end()

" Disable some built-in plugins
let g:loaded_man = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_gzip = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_shada_plugin = 1

" }}}

" Settings
" {{{ -------------------------------------------------------------------------
set encoding=UTF-8                  " UTF-8 as the default encoding.

set nobackup
set nowritebackup

set lazyredraw                      " Don't bother updating screen during macro playback
set updatetime=300                  " If this many milliseconds nothing is typed the swap file will be written to disk.
set timeoutlen=600                  " Time in milliseconds to wait for a mapped sequence to complete.
set ttimeoutlen=40                  " Time in milliseconds to wait for a key code sequence to complete.
set clipboard+=unnamedplus

" Search and Replace
set magic                           " Use 'magic' patterns (extended regular expressions).
set gdefault                        " Use 'g' flag by default with :s/foo/bar/.
set smartcase                       " ... unless the query has capital letters.
set ignorecase                      " Make searching case insensitive

set incsearch                       " Incremental search.
set inccommand=split                " Icremental search to open preview window

set wildignorecase                  " Ignore case in wildignore
set wildignore=*.swp,*.bak,*.cache,*.min.*,**/dist/**,**/.git/**,*-lock.json " Wildignore paths

" White Space
set expandtab                       " Expand tabs into spaces.
set tabstop=4                       " Set tab to equal 4 spaces.
set shiftround                      " Shift to the next round tab stop.
set shiftwidth=4                    " Set auto indent spacing.
set softtabstop=4                   " Set soft tabs equal to 4 spaces.

set smartindent                     " Does the right thing (mostly) in programs
set conceallevel=0                  " Text is shown normally

set wrap                            " Enable line wrapping.
set linebreak                       " Wrap long lines at a character
set textwidth=0                     " Hard-wrap long lines as you type them.
set linespace=0                     " Set line-spacing to minimum.

set list                            " Displays whitespace
set listchars=tab:··,trail:·        " Show leading whitespace

" Presentation
set hidden                          " Allow hidden buffers.

set cc=80                           " Highlight column at 80
set number                          " Show line numbers
set relativenumber                  " Relative line numbers
set signcolumn=yes                  " When and how to draw the signcolumn.

set foldlevel=1
set nofoldenable                    " Don't fold by default
set foldnestmax=20                  " Deepest fold is 20 levels
set foldmethod=indent               " Fold based on indent

set scrolloff=3                     " Show next 3 lines while scrolling.
set nostartofline                   " Do not jump to first character with page commands.
set sidescrolloff=5                 " Show next 5 columns while side-scrolling.

set laststatus=2                    " Always display statusline
set showtabline=2                   " Always show tabs

set ruler                           " Show the line and column number of the cursor position
set noshowcmd                       " Hide command in status line.
set noshowmode                      " Hide vim mode message on the last line.
set cmdheight=1                     " Number of screen lines to use for the command-line.
set cmdwinheight=1                  " Number of screen lines to use for the command-line window.

set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow                      " Horizontal split below current.
set splitright                      " Vertical split to right of current.

set shortmess+=c                    " Avoid showing message extra message when using completion
set pumheight=10                    " Maximum number of items to show in the popup menu
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience

" User Interface
set termguicolors                   " Enables 24-bit RGB color in the |TUI|.
filetype plugin indent on           " Load syntax files for better indenting.

" Providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0

" Plugins

" Nord theme
augroup nord-overrides
    autocmd!
    autocmd ColorScheme nord highlight Folded cterm=italic,bold gui=italic,bold guifg=#4C566A ctermbg=none guibg=none
augroup END

let g:nord_italic = v:true
let g:nord_borders = v:true
let g:nord_contrast = v:true
let g:nord_disable_background = v:true

colorscheme nord

" Treesitter
lua require('nvim-treesitter.configs').setup({ ensure_installed = 'maintained', highlight = { enable = true }})

" Trouble
lua require('trouble').setup()

" Nvim LspConfig
highlight LspDiagnosticsDefaultError guifg=#BF616A
highlight LspDiagnosticsDefaultWarning guifg=#EBCB8B

lua << EOF
    local signs = { Error = ' ', Warning = ' ', Hint = ' ', Information = ' ' }

    for type, icon in pairs(signs) do
        local hl = 'LspDiagnosticsSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = false,
        update_in_insert = false,
    })
EOF

lua << EOF
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require'lspconfig'.html.setup { on_attach = require('completion').on_attach, capabilities = capabilities }
    require'lspconfig'.cssls.setup { on_attach = require('completion').on_attach, capabilities = capabilities }
    require'lspconfig'.jsonls.setup { on_attach = require('completion').on_attach, capabilities = capabilities }
EOF

lua require('lspconfig').tailwindcss.setup({ filetypes = { 'css' }, on_attach = require('completion').on_attach })

lua require('lspconfig').vuels.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').svelte.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').tsserver.setup({ on_attach = require('completion').on_attach })

lua require('lspconfig').pylsp.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').vimls.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').bashls.setup({ on_attach = require('completion').on_attach })

" Completion Nvim
let g:completion_sorting = 'length'
let g:completion_trigger_on_delete = 1
let g:completion_auto_change_source = 0

let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_chain_complete_list = [
    \ {'complete_items': ['lsp']},
    \ {'complete_items': ['snippet']},
    \ {'complete_items': ['buffer']},
    \ {'complete_items': ['buffers']},
    \ {'complete_items': ['path'], 'triggered_only': ['/']}
\]

" Nvim Autopairs
lua require('nvim-autopairs').setup()

" Nvim TS Autotag
lua require('nvim-ts-autotag').setup()

" Nvim-spectre
lua require('spectre').setup()

" Telescope
lua require('telescope').setup({ defaults = { layout_config = { prompt_position = 'top' }, sorting_strategy = 'ascending' } })

" Formatter.nvim
lua require('formatter').setup({ 
    \ logging = false, 
    \ filetype = { 
        \ html = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ css = { function() return { 
            \ exe = 'stylelint', 
            \ args = { '--fix --stdin-filename', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ javascript = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ javascriptreact = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ typescript = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ typescriptreact = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ svelte = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ vue = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ json = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end },
        \ vim = { function() return { 
            \ exe = 'prettier', 
            \ args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, 
            \ stdin = true 
        \ } end }
    \ }
\})

" VGit
lua require('vgit').setup({ controller = { blames_enabled = false, diff_preference = 'horizontal' } })

" GitLinker
lua require('gitlinker').setup({ mappings = nil })

" Neogit
lua require('neogit').setup()

" Diffview.nvim
lua require('diffview').setup()

" Ranger
let g:rnvimr_enable_ex = 1 " Enable Ranger to replace builtin Netrw to be a file explorer.
let g:rnvimr_enable_bw = 1 " Make Neovim automatically execute |bwipeout| to wipe out the buffers deleted by Ranger.

let g:rnvimr_enable_picker = 1 " Enable Ranger to be hidden after picking a file.
let g:rnvimr_hide_gitignore = 1 " Make Ranger to hide the files included in gitignore when show_hidden=False in Ranger.

let g:rnvimr_draw_border = 1 " Using builtin curses in Ranger to draw a border for the floating window.
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1} " Change the border's color integer value is [-1, 255].
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"' " Set up only two columns

" Customize the initial layout
let g:rnvimr_layout = { 
    \ 'relative': 'editor',
    \ 'width': float2nr(round(0.9 * &columns)),
    \ 'height': float2nr(round(0.9 * &lines)),
    \ 'col': float2nr(round(0.05 * &columns)),
    \ 'row': float2nr(round(0.05 * &lines)),
    \ 'style': 'minimal'
\}

" Nvim Tree
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1 }

" Package Info
lua require('package-info').setup()

" Nvim Dashboard
let g:dashboard_default_executive = 'telescope'

" Nvim Bufferline
lua require('bufferline').setup()

" Galaxyline
lua require('galaxyline-settings')

" Surround Nvim
lua require('surround').setup({})

" Which Key
lua require('which-key').setup({ 
    \ plugins = {
        \ marks = false,
        \ registers = false,
        \ spelling = {
            \ enabled = false,
            \ suggestions = 20
        \ },
        \ presets = {
            \ operators = true,
            \ motions = true,
            \ text_objects = true,
            \ windows = true,
            \ nav = true, 
            \ z = true,
            \ g = true
        \ },
    \ },
    \ ignore_missing = true 
\})

" Todo Comments
let g:kommentary_create_default_mappings = 0

" }}}

" Mappings
" {{{ -------------------------------------------------------------------------

" Leader
let mapleader = ' '

" Remap esc
inoremap jj <Esc>

" Use v to toggle visual mode.
vno v <Esc>

" Move to beginning/end of line
noremap B ^
noremap E $

" Move selected line / block of text in visual mode
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Repeat change/replace of word multiple times
nnoremap cn *``cgn
nnoremap cN *``cgN

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Sort lines 
vnoremap <silent> <Leader>la :\'<,\'>sort<CR>
vnoremap <silent> <Leader>ll :! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickfix list navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" Location list navigation
nnoremap [l :lrevious<CR>
nnoremap ]l :lnext<CR>

" Apply Macros with Q
" Hit qq to record, q to stop recording, and Q to apply.
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Buffers
nnoremap <silent> <Leader>x :Bwipeout<CR>
nnoremap <silent> <Leader>X :bufdo! :Bwipeout<CR>

" Quickly edit/reload the vimrc file
lua require('which-key').register({ 
    \ ['<Leader>v'] = { name = 'Vim' },
    \ ['<Leader>ve'] = { ':e $MYVIMRC<CR>', 'Edit' },
    \ ['<Leader>vs'] = { ':so $MYVIMRC<CR>', 'Source' },
    \ ['<Leader>vr'] = { ':Reload<CR>', 'Reload' },
    \ ['<Leader>vR'] = { ':Restart<CR>', 'Restart' }
\})

" Write (Save)
nnoremap <Leader>w :update<CR>
nnoremap <Leader>W :wall<CR>

" Plugins

" Trouble
lua require('which-key').register({ 
    \ ['<Leader>t'] = { name = 'Trouble' },
    \ ['<Leader>tt'] = { ':TroubleToggle<CR>', 'Toggle' },
    \ ['<Leader>tr'] = { ':TroubleToggle lsp_references<CR>', 'References LSP' },
    \ ['<Leader>tw'] = { ':TroubleToggle lsp_workspace_diagnostics<CR>', 'Workspace LSP' },
    \ ['<Leader>td'] = { ':TroubleToggle lsp_document_diagnostics<CR>', 'Document LSP' },
    \ ['<Leader>tT'] = { ':TodoTrouble<CR>', 'Todos' }
\})

" Nvim LspConfig & Symbols Outline & Formatter.nvim
lua require('which-key').register({ 
    \ ['<Leader>l'] = { name = 'LSP Client' },
    \ ['<Leader>lh'] = { ':lua vim.lsp.buf.hover()<CR>', 'Hover' },
    \ ['<Leader>ls'] = { ':lua vim.lsp.buf.signature_help()<CR>', 'Signature' },
    \ ['<Leader>lo'] = { ':SymbolsOutline<CR>', 'Symbols Outline' },
    \ ['<Leader>ld'] = { ':lua vim.lsp.buf.definition()<CR>', 'Definition' },
    \ ['<Leader>lD'] = { ':Dash<CR>', 'Dash' },
    \ ['<Leader>lr'] = { ':lua vim.lsp.buf.references()<CR>', 'References' },
    \ ['<Leader>li'] = { ':lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
    \ ['<Leader>la'] = { ':lua vim.lsp.buf.code_action()<CR>', 'Action' },
    \ ['<Leader>ln'] = { ':lua vim.lsp.buf.rename()<CR>', 'Rename' },
    \ ['<Leader>lf'] = { ':lua vim.lsp.buf.formatting()<CR>', 'Format LSP' },
    \ ['<Leader>lF'] = { ':Format<CR>', 'Format' }
\})

lua require('which-key').register({ 
    \ ['<Leader>l'] = { name = 'LSP Client' },
    \ ['<Leader>lf'] = { ':lua vim.lsp.buf.range_formatting()<CR>', 'Format Range' }
\}, { mode = 'v' })

nnoremap <silent>[g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>]g :lua vim.lsp.diagnostic.goto_next()<CR>

" Completion Nvim
imap <C-l> <Plug>(completion_next_source)
imap <C-h> <Plug>(completion_prev_source)

" Nvim-spectre
lua require('which-key').register({ 
    \ ['<Leader>f'] = { name = 'Find & Replace' },
    \ ['<Leader>fp'] = { ':lua require(\'spectre\').open()<CR>', 'Project-Wide' },
    \ ['<Leader>fb'] = { ':lua require(\'spectre\').open_file_search()<CR>', 'Buffer' },
    \ ['<Leader>fw'] = { ':lua require(\'spectre\').open_visual({ select_word = true })<CR>', 'Current Word' }
\})

lua require('which-key').register({ 
    \ ['<Leader>f'] = { name = 'Find & Replace' },
    \ ['<Leader>fw'] = { ':lua require(\'spectre\').open_visual()<CR>', 'Word' }
\}, { mode = 'v' })

" Telescope
lua require('which-key').register({ 
    \ ['<Leader>s'] = { name = 'Search' },
    \ ['<Leader>sf'] = { ':Telescope find_files<CR>', 'Project Files' },
    \ ['<Leader>sw'] = { ':Telescope live_grep<CR>', 'Project Words' },
    \ ['<Leader>sW'] = { ':Telescope grep_string<CR>', 'Project Current Word' },
    \ ['<Leader>sb'] = { ':Telescope buffers<CR>', 'Buffers' },
    \ ['<Leader>sc'] = { ':Telescope commands<CR>', 'Commands' },
    \ ['<Leader>sm'] = { ':Telescope marks<CR>', 'Marks' },
    \ ['<Leader>sr'] = { ':Telescope registers<CR>', 'Registers' },
    \ ['<Leader>st'] = { ':TodoTelescope<CR>', 'Todos' },
    \ ['<Leader>sg'] = { name = 'Git' },
    \ ['<Leader>sgf'] = { ':Telescope git_files<CR>', 'Files' },
    \ ['<Leader>sgc'] = { ':Telescope git_bcommits<CR>', 'Commits' },
    \ ['<Leader>sgC'] = { ':Telescope git_commits<CR>', 'Project Commits' },
    \ ['<Leader>sgb'] = { ':Telescope git_branches<CR>', 'Branches' }
\})

" Highlight-Current-n
nmap n <Plug>(highlight-current-n-n)
nmap N <Plug>(highlight-current-n-N)
nmap * *N

" VGit & Neogit & GitLinker
lua require('which-key').register({ 
    \ ['<Leader>g'] = { name = 'Git' },
    \ ['<Leader>gs'] = { ':Neogit<CR>', 'Status (Neogit)' },
    \ ['<Leader>gb'] = { ':VGit toggle_buffer_blames<CR>', 'Blame Toggle' },
    \ ['<Leader>gh'] = { name = 'Hunk' },
    \ ['<Leader>ght'] = { ':VGit toggle_buffer_hunks<CR>', 'Toggle' },
    \ ['<Leader>ghp'] = { ':VGit hunk_preview<CR>', 'Preview' },
    \ ['<Leader>ghr'] = { ':VGit hunk_reset<CR>', 'Reset' },
    \ ['<Leader>gd'] = { name = 'Diff' },
    \ ['<Leader>gdd'] = { ':VGit diff<CR>', 'Diff' },
    \ ['<Leader>gdD'] = { ':DiffviewOpen HEAD<CR>', 'Diffview' },
    \ ['<Leader>gdb'] = { ':VGit buffer_preview<CR>', 'Buffer Preview' },
    \ ['<Leader>gdh'] = { ':VGit buffer_history<CR>', 'Buffer History' },
    \ ['<Leader>gdr'] = { ':VGit buffer_reset<CR>', 'Buffer Reset' },
    \ ['<Leader>gl'] = { name = 'Linker' },
    \ ['<Leader>gly'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'n\')<CR>', 'Yank' },
    \ ['<Leader>glO'] = { ':lua require(\'gitlinker\').get_repo_url({ action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Project' },
    \ ['<Leader>glo'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'n\', { action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Selected' },
\})

lua require('which-key').register({ 
    \ ['<Leader>g'] = { name = 'Git' },
    \ ['<Leader>gly'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'v\')<CR>', 'Yank' },
    \ ['<Leader>glo'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'v\', { action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Selected' }
\}, { mode = 'v' })

nnoremap <silent>[h :VGit hunk_up<CR>
nnoremap <silent>]h :VGit hunk_down<CR>

" Ranger
lua require('which-key').register({ ['<Leader>r'] = { ':RnvimrToggle<CR>', 'Ranger' } })

" Nvim Tree
lua require('which-key').register({ ['<Leader>e'] = { ':NvimTreeToggle<CR>', 'Explorer' } })

" Package Info
lua require('which-key').register({ 
    \ ['<Leader>p'] = { name = 'Package Info' },
    \ ['<Leader>pu'] = { ':lua require(\'package-info\').update()<CR>', 'Update Package' },
    \ ['<Leader>pd'] = { ':lua require(\'package-info\').delete()<CR>', 'Delete Package' },
    \ ['<Leader>pi'] = { ':lua require(\'package-info\').install()<CR>', 'Install New Package' },
    \ ['<Leader>pr'] = { ':lua require(\'package-info\').reinstall()<CR>', 'Reinstall Dependencies' },
    \ ['<Leader>pv'] = { ':lua require(\'package-info\').change_version()<CR>', 'Install Different Version' },
\})

" Nvim Bufferline
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>[t :BufferLineMovePrev<CR>
nnoremap <silent>]t :BufferLineMoveNext<CR>

" Kommentary
lua require('which-key').register({ 
    \ ['<Leader>c'] = { name = 'Comment Text' },
    \ ['<Leader>cc'] = { '<Plug>kommentary_line_default', 'Line' },
    \ ['<Leader>cm'] = { '<Plug>kommentary_motion_default', 'Motion' }
\})

lua require('which-key').register({ 
    \ ['<Leader>c'] = { name = 'Comment Text' },
    \ ['<Leader>cc'] = { '<Plug>kommentary_visual_default', 'Visual' }
\}, { mode = 'v' })

" }}}

" Functions
" {{{ -------------------------------------------------------------------------

" Clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Plugins

" vim:foldmethod=marker
