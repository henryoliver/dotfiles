" Plugins
" ------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" Language
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Search
Plug 'romainl/vim-cool'
Plug 'cloudhead/neovim-fuzzy'

" Integrations
Plug 'kassio/neoterm'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'itspriddle/vim-marked',   { 'for': 'markdown' }

" Interface
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'

" Other
Plug 'mhinz/vim-sayonara'
Plug 'takac/vim-hardtime'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

" Settings
" ------------------------------------------------------------------------------
set clipboard+=unnamedplus        " Mac OS X clipboard sharing

" Search and Replace
set hlsearch                      " Highlight search results.
set ignorecase                    " Make searching case insensitive
set smartcase                     " ... unless the query has capital letters.
set incsearch                     " Incremental search.
set gdefault                      " Use 'g' flag by default with :s/foo/bar/.
set magic                         " Use 'magic' patterns (extended regular expressions).

" White Space
set tabstop=4                     " Set tab to equal 4 spaces.
set expandtab                     " Expand tabs into spaces.
set shiftwidth=4                  " Set auto indent spacing.
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set smartindent                   " Does the right thing (mostly) in programs
set shiftround                    " Shift to the next round tab stop.
set textwidth=0                   " Hard-wrap long lines as you type them.
set conceallevel=0                " Text is shown normally

set listchars=tab:··,trail:·      " Show leading whitespace
set list                          " Displays whitespace

" Presentation
set shortmess=aIoO                " Show short messages, no intro.
set showcmd                       " Show (partial) command in status line.
set ruler                         " Show the cursor position.
set cf                            " Enable error jumping.
set hidden                        " Allow hidden buffers.

set number                        " Show line numbers
set relativenumber                " Relative line numbers
set cursorline                    " Highlight the line containing the cursor.

set cc=80                         " Highlight column at 80
set linespace=0                   " Set line-spacing to minimum.
set wrap                          " Enable line wrapping.
set linebreak                     " Wrap long lines at a character

set nojoinspaces                  " Prevents inserting two spaces after punctuation on a join (J)
set showmatch                     " Show matching parenthesis.
set matchpairs+=<:>               " Pairs to match.

set splitbelow                    " Horizontal split below current.
set splitright                    " Vertical split to right of current.

set scrolloff=3                   " Show next 3 lines while scrolling.
set sidescrolloff=5               " Show next 5 columns while side-scrolling.
set display+=lastline
set nostartofline                 " Do not jump to first character with page commands.

set foldmethod=indent             " Fold based on indent
set foldnestmax=20                " Deepest fold is 20 levels
set nofoldenable                  " Don't fold by default
set foldlevel=1

syntax enable                     " Enable syntax highlighting.
filetype plugin indent on         " Load syntax files for better indenting.

" User Interface
set termguicolors

" Status Line
set laststatus=2                        " Always show status.
set fillchars+=stl:\ ,stlnc:\ " Space.  " Disable status line fill chars.
set noshowmode                          " Get rid of the default mode indicator
set cmdheight=1
set scrolloff=10

" Others
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.6.0/bin/neovim-ruby-host'

" Plugins

" Nord theme
augroup nord-overrides
    autocmd!
    autocmd ColorScheme nord highlight Italic cterm=italic gui=italic
    autocmd ColorScheme nord highlight Folded cterm=italic,bold gui=italic,bold ctermbg=none guibg=none 
    autocmd ColorScheme nord highlight Search ctermbg=3 ctermfg=0 guibg=#434C5E guifg=#D8DEE9
augroup END

let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

colorscheme nord

" Neomake
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

" Gutentags
set statusline+=%{gutentags#statusline()} " To know when Gutentags is generating tags

" Deoplete.
let g:deoplete#enable_at_startup = 1

" Deoplete ternjs
let g:deoplete#sources#ternjs#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx',
    \ 'vue',
    \ 'svelte'
    \ ]

" Vim-signify
let g:signify_vcs_list = ['git']

" Mundo
let g:mundo_width = 100
let g:mundo_preview_height = 40
let g:mundo_right = 1

" NERD Commenter
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

" Hardtime
let g:hardtime_default_on = 1

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 " Open ranger when vim open a directory

" Mappings
" ------------------------------------------------------------------------------

" Leader
let mapleader = ' '

" Use Q to execute default register.
map Q @q

" Remap esc
imap jj <Esc>

" Use v to toggle visual mode.
vno v <Esc>

" Copy current files path to clipboard
map cp :let @+ = expand('%') <CR>

" Quickly edit/reload the vimrc file
map <silent> <leader>ev :e $MYVIMRC<CR>
map <silent> <leader>sv :so $MYVIMRC<CR>

" Switch Off The Current Search
map <silent> <leader>/ :nohlsearch<CR>

" Clean the highlight text
map <leader>h :set hlsearch!<CR>

" Save
map <leader>s :update<CR>
map <leader>ss :wall<CR>

" Quit
map <leader>q :q<CR>
map <leader>Q :qa!<CR>

" Plugins

" Neomake
nmap <Leader>lo :lopen<CR>      " open location window
nmap <Leader>lc :lclose<CR>     " close location window
nmap <Leader>ll :ll<CR>         " go to current error/warning
nmap <Leader>ln :lnext<CR>      " next error/warning
nmap <Leader>lp :lprev<CR>      " previous error/warning

" Goyo
map <leader>G :Goyo<CR>

" Fuzzy
map <leader>p :FuzzyOpen<CR>
map <leader>f :FuzzyGrep<CR>

" Sayonara
map <leader>x :Sayonara<CR>
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'

" Ranger
map <leader>r :Ranger<CR>

" Functions
" ------------------------------------------------------------------------------

" Copy file
command! -nargs=1 -complete=file Cp :w <args> | :e <args>

" Plugins

" Neomake

" When writing a buffer.
call neomake#configure#automake('w')

