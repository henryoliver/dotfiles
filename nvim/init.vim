" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" Language
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Integrations
Plug 'kassio/neoterm'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'kevinhwang91/rnvimr' " Ranger
Plug 'itspriddle/vim-marked',   { 'for': 'markdown' }

" Interface
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'ryanoasis/vim-devicons'

" Commands
Plug 'junegunn/vim-slash'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-sandwich'

" Other
Plug 'editorconfig/editorconfig-vim'

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
set clipboard+=unnamedplus        " Mac OS X clipboard sharing

set tags=./.tags;,.tags;          " Tell Vim where to look for tags files

" Search and Replace
set magic                         " Use 'magic' patterns (extended regular expressions).
set hlsearch                      " Highlight all search matches
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
set laststatus=0                  " Never show when the last window will have a status line
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

" User Interface
set termguicolors                 " Enables 24-bit RGB color in the |TUI|.
set signcolumn=yes                " When and how to draw the signcolumn.
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

" Vim Polyglot
let g:python_highlight_space_errors = 0

" Coc
let g:coc_snippet_next = '<C-j>' " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<C-k>' " Use <C-k> for jump to previous placeholder, it's default of coc.nvim

" FZF
let g:fzf_tags_command = 'ctags -Rf .tags .'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse' " To pass additional options

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_repl_python = 'bpython'
let g:neoterm_default_mod = 'vertical'

" Vim-signify
let g:signify_sign_add = '+'
let g:signify_sign_change = '~'
let g:signify_sign_delete = '_'
let g:signify_vcs_list = ['git']
let g:signify_sign_delete_first_line = '‾'

" I find the numbers disctracting
let g:signify_sign_show_text = 1
let g:signify_sign_show_count = 0

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
            \ 'width': float2nr(round(0.8 * &columns)),
            \ 'height': float2nr(round(0.8 * &lines)),
            \ 'col': float2nr(round(0.1 * &columns)),
            \ 'row': float2nr(round(0.1 * &lines)),
            \ 'style': 'minimal'}

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

" Mundo
let g:mundo_right = 0
let g:mundo_width = 100
let g:mundo_preview_height = 40

" TComment
let g:tcomment_maps = 0
let g:tcomment_mapleader1 = ''
let g:tcomment_mapleader2 = ''
let g:tcomment_mapleader_comment_anyway = ''
let g:tcomment_textobject_inlinecomment = ''

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

" Sort lines by length
vnoremap <silent> <Leader>sl : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

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

" Coc
" Use <c-space> for trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <silent> <Leader>rn <Plug>(coc-rename)
nnoremap <silent> <Leader>rnp :CocSearch <C-r>=expand('<cword>')<CR><CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
nmap <silent> <Leader>FF <Plug>(coc-format)
xmap <silent> <Leader>FF <Plug>(coc-format-selected)

" CodeAction of selected region
vmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)

nnoremap <silent> <Leader>e :CocCommand explorer<CR>

" FZF
" nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>p :GFiles --exclude-standard --others --cached<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>f :RG<CR>

nnoremap <silent> <Leader>st :Tags<CR>
nnoremap <silent> <Leader>sm :Marks<CR>
nnoremap <silent> <Leader>scm :Commands<CR>
nnoremap <silent> <Leader>sma :Maps<CR>

nnoremap <silent> <Leader>g :GGrep<CR>
nnoremap <silent> <Leader>gt :GTags<CR>
nnoremap <silent> <Leader>gc :Commits<CR>
nnoremap <silent> <Leader>gb :GBranches<CR>
nnoremap <silent> <Leader>gcb :BCommits<CR>

" Neoterm
nnoremap <silent> <Leader>t :Tnew<CR>
nnoremap <silent> <Leader>tc :Tclear<CR>
nnoremap <silent> <Leader>tk :Tkill<CR>
nnoremap <silent> <Leader>tx :Tclose!<CR>
nnoremap <silent> <Leader>txx :TcloseAll!<CR>
nnoremap <silent> <Leader>tsf :TREPLSendFile<CR>
nnoremap <silent> <Leader>tsl :TREPLSendLine<CR>
vnoremap <silent> <Leader>tss :TREPLSendSelection<CR>

" Signify
nnoremap <Leader>gh :SignifyToggleHighlight<CR>
nnoremap <Leader>gJ 9999<Leader>gj
nnoremap <Leader>gK 9999<Leader>gk
nnoremap <Leader>gj <Plug>(signify-next-hunk)
nnoremap <Leader>gk <Plug>(signify-prev-hunk)

" Fugitive
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gl :diffget //2<CR>
nnoremap <Leader>gr :diffget //3<CR>
nnoremap <Leader>gd :Gvdiffsplit!<CR>

" Ranger
nnoremap <silent> <Leader>r :RnvimrToggle<CR>

" Mundo
nnoremap <silent> <Leader>u :MundoToggle<CR>

" TComment
nnoremap <silent> <Leader>c :TComment<CR>
vnoremap <silent> <Leader>c :TCommentBlock<CR>

" }}}

" Functions
" {{{ -------------------------------------------------------------------------

" Copy file
command! -nargs=1 -complete=file Cp :w <args> | :e <args>

" Plugins

" COC
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" FZF
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

" In the default implementation of Rg, ripgrep process starts only once with the initial query (e.g. :Rg foo) and fzf filters the output of the process.
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number -- '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" vim:foldmethod=marker
