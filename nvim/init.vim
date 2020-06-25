" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" Language
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Search
Plug 'haya14busa/is.vim'
Plug 'nelstrom/vim-visual-star-search'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Integrations
Plug 'kassio/neoterm'

Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb' " Github
Plug 'tpope/vim-fugitive'

Plug 'kevinhwang91/rnvimr', { 'do': 'make sync' } " Ranger
Plug 'itspriddle/vim-marked',   { 'for': 'markdown' }

" Interface
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'simnalamburt/vim-mundo'

" Commands
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-sandwich'

" Other
Plug 'takac/vim-hardtime'
Plug 'metakirby5/codi.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

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

" Vim Closetag
let g:closetag_filenames = '*.html, *.js, *.jsx'

" COC
let g:coc_snippet_next = '<c-j>' " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>' " Use <C-k> for jump to previous placeholder, it's default of coc.nvim

" FZF
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_repl_python = 'bpython'
let g:neoterm_default_mod = 'vertical'

" Vim-signify
let g:signify_vcs_list = ['git']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_text = 1
let g:signify_sign_show_count = 0

" Ranger
let g:rnvimr_ex_enable = 1 " Make Ranger replace Netrw and be the file explorer
let g:rnvimr_pick_enable = 1 " Make Ranger to be hidden after picking a file
let g:rnvimr_draw_border = 1 " Disable a border for floating window
let g:rnvimr_bw_enable = 1 " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1} " Change the border's color integer value is [-1, 255].
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"' " Set up only two columns

" Customize the initial layout
let g:rnvimr_layout = { 
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.8 * &columns)),
            \ 'height': float2nr(round(0.8 * &lines)),
            \ 'col': float2nr(round(0.1 * &columns)),
            \ 'row': float2nr(round(0.1 * &lines)),
            \ 'style': 'minimal' }

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

" Vim HardTime
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1

" Vim be good
let g:vim_be_good_floating = 0

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

" Move selection up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" Substitute
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//<Left>

" Close buffers
nnoremap <silent> <Leader>xx :only<CR>
nnoremap <silent> <Leader>x :bdelete<CR>
nnoremap <silent> <Leader>X :bufdo :bdelete<CR>

" Save
nnoremap <Leader>s :update<CR>
nnoremap <Leader>ss :wall<CR>

" Sort lines by length
vnoremap <silent> <Leader>sl : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

" Quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" Plugins

" COC
" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-;> coc#refresh()

" Use <C-l> for trigger snippet expand.
inoremap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vnoremap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
inoremap <C-j> <Plug>(coc-snippets-expand-jump)

" Use `[g` and `]g` to navigate diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
xnoremap <silent> <Leader>F <Plug>(coc-format-selected)
nnoremap <silent> <Leader>F <Plug>(coc-format-selected)

" FZF
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>f :RG<CR>

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
nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)
nnoremap <Leader>gJ 9999<Leader>gj
nnoremap <Leader>gK 9999<Leader>gk

" Fugitive
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gd :Gvdiffsplit!<CR>
nnoremap <Leader>gl :diffget //2<CR>
nnoremap <Leader>gr :diffget //3<CR>

" Ranger
nnoremap <silent> <Leader>r :RnvimrToggle<CR>

" Goyo
nnoremap <Leader>G :Goyo<CR>

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

" FZF
" Get Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" }}}

" vim:foldmethod=marker
