" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" Language
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Completion
Plug 'neovim/nvim-lspconfig'

Plug 'onsails/lspkind-nvim' " Adds vscode-like pictograms to neovim built-in lsp
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'

Plug 'norcalli/snippets.nvim'
Plug 'steelsojka/completion-buffers'
Plug 'aca/completion-tabnine', { 'do': 'version=3.1.9 ./install.sh' }

Plug 'windwp/nvim-autopairs'

" Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'kevinhwang91/nvim-hlslens'
Plug 'nvim-telescope/telescope.nvim'

" Integrations
Plug 'TimUntersberger/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'

Plug 'kevinhwang91/rnvimr' " Ranger
Plug 'kyazdani42/nvim-tree.lua' " Explorer

Plug 'editorconfig/editorconfig-vim'
Plug 'npxbr/glow.nvim', { 'do': ':GlowInstall' }

" Interface
Plug 'mhinz/vim-startify'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }

" Commands
Plug 'b3nj5m1n/kommentary'
Plug 'blackcauldron7/surround.nvim'

" Other
Plug 'takac/vim-hardtime'

" Initialize plugin system
call plug#end()
" }}}

" Settings
" {{{ -------------------------------------------------------------------------
set encoding=UTF-8                " UTF-8 as the default encoding.

set nobackup                      " Make a backup before overwriting a file.
set nowritebackup

set lazyredraw                    " Don't bother updating screen during macro playback
set updatetime=300                " If this many milliseconds nothing is typed the swap file will be written to disk.
set timeoutlen=600                " Time in milliseconds to wait for a mapped sequence to complete.
set ttimeoutlen=40                " Time in milliseconds to wait for a key code sequence to complete.
set clipboard+=unnamedplus

set tags=./.tags;,.tags;          " Tell Vim where to look for tags files

" Search and Replace
set magic                         " Use 'magic' patterns (extended regular expressions).
set gdefault                      " Use 'g' flag by default with :s/foo/bar/.
set smartcase                     " ... unless the query has capital letters.
set incsearch                     " Incremental search.
set ignorecase                    " Make searching case insensitive

" White Space
set tabstop=4                     " Set tab to equal 4 spaces.
set expandtab                     " Expand tabs into spaces.
set shiftwidth=4                  " Set auto indent spacing.
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set smartindent                   " Does the right thing (mostly) in programs
set shiftround                    " Shift to the next round tab stop.
set textwidth=0                   " Hard-wrap long lines as you type them.
set conceallevel=0                " Text is shown normally

set list                          " Displays whitespace
set listchars=tab:··,trail:·      " Show leading whitespace

" Presentation
set cf                            " Enable error jumping.
set hidden                        " Allow hidden buffers.
set ruler                         " Show the line and column number of the cursor position
set noshowcmd                     " Hide command in status line.
set noshowmode                    " Hide vim mode message on the last line.
set cmdheight=1                   " Number of screen lines to use for the command-line.
set cmdwinheight=1                " Number of screen lines to use for the command-line window.

set number                        " Show line numbers
set relativenumber                " Relative line numbers

set cc=80                         " Highlight column at 80
set wrap                          " Enable line wrapping.
set linebreak                     " Wrap long lines at a character
set linespace=0                   " Set line-spacing to minimum.

set nojoinspaces                  " Prevents inserting two spaces after punctuation on a join (J)
set matchpairs+=<:>               " Pairs to match.

set splitbelow                    " Horizontal split below current.
set splitright                    " Vertical split to right of current.

set scrolloff=3                   " Show next 3 lines while scrolling.
set nostartofline                 " Do not jump to first character with page commands.
set sidescrolloff=5               " Show next 5 columns while side-scrolling.

set foldlevel=1
set nofoldenable                  " Don't fold by default
set foldnestmax=20                " Deepest fold is 20 levels
set foldmethod=indent             " Fold based on indent

set formatoptions-=cro            " Disable auto-wrap and auto-insert comment

set shortmess+=c                  " Avoid showing message extra message when using completion
set pumheight=10                  " Maximum number of items to show in the popup menu
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience

" User Interface
set termguicolors                 " Enables 24-bit RGB color in the |TUI|.
set signcolumn=yes                " When and how to draw the signcolumn.
filetype plugin indent on         " Load syntax files for better indenting.

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0

" Plugins

" Nord theme
augroup nord-overrides
    autocmd!
    autocmd ColorScheme nord highlight Italic cterm=italic gui=italic
    autocmd ColorScheme nord highlight Folded cterm=italic,bold gui=italic,bold ctermbg=none guibg=none
    autocmd ColorScheme nord highlight Search ctermbg=3 ctermfg=0 guibg=#434C5E guifg=#D8DEE9
augroup END

let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1

colorscheme nord

" Treesitter
lua require('nvim-treesitter.configs').setup({ ensure_installed = 'maintained', highlight = { enable = true }})

" Nvim LspConfig
highlight LspDiagnosticsDefaultError guifg=#BF616A
highlight LspDiagnosticsDefaultWarning guifg=#EBCB8B

lua require('lspconfig').html.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').cssls.setup({ on_attach = require('completion').on_attach })

lua require('lspconfig').vuels.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').jsonls.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').svelte.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').tsserver.setup({ on_attach = require('completion').on_attach })

lua require('lspconfig').pyls.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').vimls.setup({ on_attach = require('completion').on_attach })
lua require('lspconfig').bashls.setup({ on_attach = require('completion').on_attach })

lua require('lspconfig').diagnosticls.setup({
    \ on_attach = require('completion').on_attach,
    \ filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'markdown' },
    \ init_options = {
        \ linters = {
            \ eslint = {
                \ debounce = 100,
                \ command = 'eslint',
                \ sourceName = 'eslint',
                \ rootPatterns = { '.git' },
                \ args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
                \ parseJson = {
                    \ line = 'line',
                    \ column = 'column',
                    \ endLine = 'endLine',
                    \ security = 'severity',
                    \ endColumn = 'endColumn',
                    \ errorsRoot = '[0].messages',
                    \ message = '[eslint] ${message} [${ruleId}]'
                \ },
                \ securities = {
                    \ [2] = 'error',
                    \ [1] = 'warning'
                \ }
            \ },
            \ stylelint = {
                \ debounce = 100,
                \ args = { '--stdin' },
                \ command = 'stylelint ',
                \ sourceName = 'stylelint',
                \ rootPatterns = { '.git' }
            \ },
            \ markdownlint = {
                \ debounce = 100,
                \ offsetLine = 0,
                \ formatLines = 1,
                \ isStderr = true,
                \ offsetColumn = 0,
                \ args = { '--stdin' },
                \ command = 'markdownlint',
                \ rootPatterns = { '.git' },
                \ sourceName = 'markdownlint',
                \ securities = { undefined = 'hint' },
                \ formatPattern = {
                    \ '^.*:(\\d+)\\s+(.*)$',
                    \ {
                        \ line = 1,
                        \ column = -1,
                        \ message = 2
                    \ }
                \ }
            \ }
        \ },
        \ filetypes = {
            \ javascript = 'eslint',
            \ javascriptreact = 'eslint',
            \ typescript = 'eslint',
            \ typescriptreact = 'eslint',
            \ css = 'stylelint',
            \ markdown = 'markdownlint'
        \ },
        \ formatters = {
            \ prettierEslint = {
                \ command = 'prettier-eslint',
                \ args = { '--stdin' },
                \ rootPatterns = { '.git' }
            \ },
            \ prettierStylelint = {
                \ command = 'prettier-stylelint',
                \ args = { '--stdin' },
                \ rootPatterns = { '.git' }
            \ },
            \ prettier = {
                \ command = 'prettier',
                \ args = { '--stdin-filepath', '%filename' }
            \ }
        \ },
        \ formatFiletypes = {
            \ css = 'prettierStylelint',
            \ javascript = 'prettierEslint',
            \ javascriptreact = 'prettierEslint',
            \ json = 'prettier',
            \ typescript = 'prettierEslint',
            \ typescriptreact = 'prettierEslint'
        \ }
    \ }
\ })

" Lspkind Nvim
lua require('lspkind').init()

" Completion Nvim
" let g:completion_abbr_length = 20
" let g:completion_menu_length = 20
let g:completion_auto_change_source = 1
let g:completion_confirm_key = "\<C-l>"
let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_trigger_keyword_length = 2 " default = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_chain_complete_list = [
    \ {'complete_items': ['tabnine']},
    \ {'complete_items': ['ts']},
    \ {'complete_items': ['lsp']},
    \ {'complete_items': ['snippet']},
    \ {'complete_items': ['buffer']},
    \ {'mode': '<C-p>'},
    \ {'mode': '<C-n>'}
\]

" Snippets.nvim
lua require('snippets').use_suggested_mappings()

" Nvim Autopairs
lua require('nvim-autopairs').setup()

" Nvim Hlslens
lua require('hlslens').setup({ calm_down = true })

" Gitsigns
lua require('gitsigns').setup()

" Git Blame
let g:gitblame_enabled = 0

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

" Startify
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ ]

let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'z': '~/.zshrc' },
    \ '~/Projects'
\ ]

let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1

" Nvim Bufferline
lua require('bufferline').setup()

" Galaxyline
lua require('galaxyline-eviline-theme')

" Surround Nvim
lua require('surround').setup({})

" Vim Hardtime
let g:hardtime_default_on = 1

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
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Sort lines by length
vnoremap <silent> <Leader>sl : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

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
" Completely deletes the current buffer, error if there are unwritten changes
nnoremap <silent> <Leader>x :bwipeout<CR>
" Completely deletes all buffers except those with unwritten changes
nnoremap <silent> <Leader>X :bufdo! :bwipeout<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" Save
nnoremap <Leader>s :update<CR>
nnoremap <Leader>ss :wall<CR>

" Quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" Plugins

" Nvim LspConfig
nnoremap <Leader>ch :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>cd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>cr :lua vim.lsp.buf.references()<CR>
nnoremap <Leader>ci :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>cs :lua vim.lsp.buf.signature_help()<CR>

nnoremap <Leader>crn :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>ca :lua vim.lsp.buf.code_action()<CR>

nnoremap <Leader>cf :lua vim.lsp.buf.formatting()<CR>
vnoremap <Leader>cf :lua vim.lsp.buf.range_formatting()<CR>

nnoremap <silent>[g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>]g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Leader>cdd :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" Completion Nvim
imap <C-j> <Plug>(completion_next_source)
imap <C-k> <Plug>(completion_prev_source)

" Snippets.nvim
" inoremap <C-l> :lua return require'snippets'.expand_or_advance(1)<CR>
" inoremap <C-h> :lua return require'snippets'.advance_snippet(-1)<CR>

" Telescope
" File Pickers
nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>fgf :Telescope git_files<CR>
nnoremap <Leader>fg :Telescope live_grep<CR>
nnoremap <Leader>fgs :Telescope grep_string<CR>

" Vim Pickers
nnoremap <Leader>fb :Telescope buffers<CR>
nnoremap <Leader>fh :Telescope help_tags<CR>
nnoremap <Leader>fc :Telescope commands<CR>
nnoremap <Leader>fch :Telescope command_history<CR>
nnoremap <Leader>fm :Telescope marks<CR>
nnoremap <Leader>fq :Telescope quickfix<CR>
nnoremap <Leader>fl :Telescope loclist<CR>
nnoremap <Leader>fr :Telescope registers<CR>
nnoremap <Leader>fs :Telescope spell_suggest<CR>
nnoremap <Leader>fk :Telescope keymaps<CR>

" LSP Pickers
nnoremap <Leader>flr :Telescope lsp_references<CR>
nnoremap <Leader>fls :Telescope lsp_document_symbols<CR>

" Git Pickers
nnoremap <Leader>fgc :Telescope git_commits<CR>
nnoremap <Leader>fgcb :Telescope git_bcommits<CR>
nnoremap <Leader>fgb :Telescope git_branches<CR>
nnoremap <Leader>fgst :Telescope git_status<CR>

" Treesitter Picker
nnoremap <Leader>ft :Telescope treesitter<CR>

" Neogit
nnoremap <Leader>gs :Neogit<CR>
" nnoremap <Leader>gl :diffget //2<CR>
" nnoremap <Leader>gr :diffget //3<CR>
" nnoremap <Leader>gd :Gvdiffsplit!<CR>

" Git Blame
nnoremap <Leader>gb :GitBlameToggle<CR>

" Ranger
nnoremap <silent> <Leader>r :RnvimrToggle<CR>

" Nvim Tree
nnoremap <Leader>t :NvimTreeToggle<CR>
nnoremap <Leader>tr :NvimTreeRefresh<CR>
nnoremap <Leader>tf :NvimTreeFindFile<CR>

" Glow
nnoremap <Leader>mg :Glow<CR>

" Nvim Bufferline
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>[t :BufferLineMovePrev<CR>
nnoremap <silent>]t :BufferLineMoveNext<CR>

" }}}

" Functions
" {{{ -------------------------------------------------------------------------

" Plugins

" vim:foldmethod=marker
