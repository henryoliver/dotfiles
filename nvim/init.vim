" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" Language
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-jedi' " Python
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " JavaScript

" Search
Plug 'romainl/vim-cool'
Plug 'cloudhead/neovim-fuzzy'

" Integrations
Plug 'kassio/neoterm'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'heavenshell/vim-jsdoc', { 'do': 'npm install -g lehre' }

Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'francoiscabrol/ranger.vim'
Plug 'itspriddle/vim-marked',   { 'for': 'markdown' }

" Interface
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'

" Commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'

" Other
Plug 'takac/vim-hardtime'
Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()
" }}}

" Settings
" {{{ -------------------------------------------------------------------------
set encoding=UTF-8                " UTF-8 as the default encoding.

set lazyredraw                    " Don't bother updating screen during macro playback
set timeoutlen=600                " Time in milliseconds to wait for a mapped sequence to complete.
set ttimeoutlen=40                " Time in milliseconds to wait for a key code sequence to complete.
set clipboard+=unnamedplus        " Mac OS X clipboard sharing

" Search and Replace
set magic                         " Use 'magic' patterns (extended regular expressions).
set hlsearch                      " Highlight search results.
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
set noruler                       " Hide the cursor position.
set noshowcmd                     " Hide command in status line.
set noshowmode                    " Hide vim mode message on the last line.
set cmdheight=1                   " Number of screen lines to use for the command-line.
set laststatus=0                  " Never show when the last window will have a status line
set cmdwinheight=1                " Number of screen lines to use for the command-line window.

set number                        " Show line numbers
set relativenumber                " Relative line numbers

set wrap                          " Enable line wrapping.
set cc=80                         " Highlight column at 80
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

" Status line
set laststatus=0

" User Interface
syntax enable                     " Enable syntax highlighting.
set termguicolors                 " Enables 24-bit RGB color in the |TUI|.
filetype plugin indent on         " Load syntax files for better indenting.

" Ruby
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.7.0/bin/neovim-ruby-host'

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

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

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
    \   'css': ['stylelint'],
    \   'python': ['pylint'],
    \   'javascript': ['eslint'],
    \   'zsh': ['shell', 'shellcheck']
    \}

let g:ale_fixers = {
    \   'sh': ['shfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \   'zsh': ['shfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \   'python': ['yapf', 'trim_whitespace', 'remove_trailing_lines'],
    \   'css': ['prettier', 'stylelint', 'trim_whitespace', 'remove_trailing_lines'],
    \   'json': ['prettier', 'fixjson',  'trim_whitespace', 'remove_trailing_lines'],
    \   'javascript': ['prettier', 'eslint', 'trim_whitespace', 'remove_trailing_lines']
    \}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'

" Vim Closetag
let g:closetag_filetypes = 'html,xhtml,jsx,javascript'

" Vim polyglot
let g:python_highlight_space_errors = 0

" Gutentags
set statusline+=%{gutentags#statusline()} " To know when Gutentags is generating tags

" Deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 20)

" Deoplete ternjs
let g:deoplete#sources#ternjs#types = 1 " Whether to include the types of the completions in the result data. Default:
let g:deoplete#sources#ternjs#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx',
    \ 'vue',
    \ 'svelte'
    \ ]

" Vim-cool
let g:CoolTotalMatches = 1

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_repl_python = 'bpython'
let g:neoterm_default_mod = 'vertical'

" JsDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_lehre_path = '/usr/local/bin/lehre'

" Vim-signify
let g:signify_vcs_list = ['git']

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Mundo
let g:mundo_right = 0
let g:mundo_width = 100
let g:mundo_preview_height = 40

" TComment
" Prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcomment_maps = 0
let g:tcomment_mapleader1 = ''
let g:tcomment_mapleader2 = ''
let g:tcomment_mapleader_comment_anyway = ''
let g:tcomment_textobject_inlinecomment = ''

" Vim HardTime
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1

" Bclose
let g:bclose_no_plugin_maps = 1

" }}}

" Mappings
" {{{ -------------------------------------------------------------------------

" Leader
map <Space> <Leader>

" Remap esc
inoremap jj <Esc>

" Use v to toggle visual mode.
vno v <Esc>

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" Copy current files path to clipboard
noremap cp :let @+ = expand('%') <CR>

" Apply Macros with Q
" hit qq to record, q to stop recording, and Q to apply.
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Control + Direction to Change Panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" Substitute
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//<Left>

" Save
nnoremap <Leader>s :update<CR>
inoremap <Leader>s <C-c>:update<CR>
nnoremap <Leader>ss :wall<CR>
inoremap <Leader>ss <C-c>:wall<CR>

" Quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>
nnoremap <Leader>xx :only<CR>

" Plugins

" ALE
nnoremap <silent> <Leader>ln <Plug>(ale_next_wrap)
nnoremap <silent> <Leader>lp <Plug>(ale_previous_wrap)

" NeoSnippet
inoremap <C-k> <Plug>(neosnippet_expand_or_jump)
snoremap <C-k> <Plug>(neosnippet_expand_or_jump)
xnoremap <C-k> <Plug>(neosnippet_expand_target)

" Fuzzy
nnoremap <silent> <Leader>p :FuzzyOpen<CR>
nnoremap <silent> <Leader>f :FuzzyGrep<CR>

" Neoterm
nnoremap <silent> <Leader>t :Tnew<CR>
nnoremap <silent> <Leader>tc :Tclear<CR>
nnoremap <silent> <Leader>tk :Tkill<CR>
nnoremap <silent> <Leader>tx :Tclose!<CR>
nnoremap <silent> <Leader>txx :TcloseAll!<CR>

nnoremap <silent> <Leader>tsf :TREPLSendFile<CR>
nnoremap <silent> <Leader>tsl :TREPLSendLine<CR>
vnoremap <silent> <Leader>tss :TREPLSendSelection<CR>

" JsDoc
nmap <silent> <Leader>dj <Plug>(jsdoc)

" Pydocstring
nmap <silent> <Leader>dp <Plug>(pydocstring)

" Ranger
noremap <Leader>r :Ranger<CR>

" Goyo
nnoremap <Leader>G :Goyo<CR>

" Mundo
nnoremap <silent> <Leader>u :MundoToggle<CR>

" TComment
noremap <silent> <Leader>c :TComment<CR>

" Bclose
noremap <Leader>x :Bclose<CR>

" }}}

" Functions
" {{{ -------------------------------------------------------------------------

" Copy file
command! -nargs=1 -complete=file Cp :w <args> | :e <args>

" Plugins

" }}}

" vim:foldmethod=marker
