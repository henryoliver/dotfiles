" Plugins
" {{{ -------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'shaunsingh/nord.nvim'

" Language
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'folke/trouble.nvim' " A pretty list for showing diagnostics, references...
Plug 'rmagatti/goto-preview' " Previewing native LSP's goto definition calls

" Completion
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim' " Adds vscode-like pictograms to neovim built-in lsp

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Search
Plug 'nvim-lua/plenary.nvim' " Some plugins dependency

Plug 'windwp/nvim-spectre' " Find/Search and replace
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Code display
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'anuvyklack/pretty-fold.nvim'

" Integrations
Plug 'tanvirtin/vgit.nvim'
Plug 'ruifm/gitlinker.nvim'
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

Plug 'rizzatti/dash.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'MunifTanjim/nui.nvim' " Nvim Package Info dependency
Plug 'vuki656/package-info.nvim', { 'for': 'json' } " Display latest package versions as virtual text

" Interface
Plug 'kyazdani42/nvim-web-devicons'
Plug 'yamatsum/nvim-nonicons'

Plug 'kevinhwang91/rnvimr' " Ranger
Plug 'kyazdani42/nvim-tree.lua' " File explorer

Plug 'tamton-aquib/staline.nvim'
Plug 'akinsho/nvim-bufferline.lua'

" Commands
Plug 'AckslD/nvim-neoclip.lua'
Plug 'blackcauldron7/surround.nvim'

Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim' " Highlight and search TODO, HACK, BUG

" Other
Plug 'famiu/nvim-reload' " :Reload and :Restart commands.
Plug 'folke/which-key.nvim'
Plug 'famiu/bufdelete.nvim'

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

set conceallevel=0                  " Text is shown normally

set wrap                            " Enable line wrapping.
set linebreak                       " Wrap long lines at a character
set textwidth=0                     " Hard-wrap long lines as you type them.
set linespace=0                     " Set line-spacing to minimum.

set list                            " Displays whitespace
set listchars=tab:··,trail:·        " Show leading whitespace

" Presentation
set hidden                          " Allow hidden buffers.

set colorcolumn=80                  " Highlight column at 80
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
set completeopt=menu,menuone,noselect " Set completeopt to have a better completion experience

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

lua << EOF
    vim.g.nord_italic = true
    vim.g.nord_borders = true
    vim.g.nord_contrast = true
    vim.g.nord_disable_background = true

    -- Load the colorscheme
    require('nord').set()
EOF

" Treesitter
lua << EOF
    require('nvim-treesitter.configs').setup({ 
        ensure_installed = 'maintained', 
        highlight = { enable = true },
        indent = { enable = true }
    })
EOF

" Goto preview
lua require('goto-preview').setup({ border = nil })

" Nvim CMP
lua << EOF
    -- Setup nvim-cmp.
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local source_mapping = {
        cmp_tabnine = '[AI]',
        nvim_lsp = '[LSP]',
        vsnip = '[snip]',
        buffer = '[buffer]',
        path = '[path]'
    }

    local compare = require('cmp.config.compare')

    cmp.setup({ 
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
            end
        },
        mapping = { 
            ['<C-l>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        },
        sources = cmp.config.sources({
            { name = 'cmp_tabnine' },
            { name = 'nvim_lsp' },
            { name = 'vsnip' } -- For vsnip users.
        }, {
            { name = 'buffer' }
        }),
        formatting = {
            format = function(entry, vim_item)
                local menu = source_mapping[entry.source.name]

                vim_item.kind = lspkind.presets.default[vim_item.kind]

                if entry.source.name == 'cmp_tabnine' then
                    if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                        menu = entry.completion_item.data.detail .. ' ' .. menu
                    end

                    vim_item.kind = ''
                end

                vim_item.menu = menu

                return vim_item
            end
        },
        sorting = {
            priority_weight = 2,
            comparators = {
                require('cmp_tabnine.compare'),
                compare.offset,
                compare.exact,
                compare.score,
                compare.recently_used,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order
            }
        },
        experimental = { native_menu = false, ghost_text = true }
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    -- Setup lspconfig.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.tailwindcss.setup({ filetypes = { 'css', 'typescriptreact' } })

    lspconfig.vuels.setup({})
    lspconfig.svelte.setup({})
    lspconfig.tsserver.setup({})

    lspconfig.jsonls.setup({ capabilities = capabilities })

    lspconfig.pylsp.setup({})
    lspconfig.vimls.setup({})
    lspconfig.bashls.setup({})
    lspconfig.sumneko_lua.setup({})
EOF

" Nvim Autopairs
lua require('nvim-autopairs').setup()

" Nvim TS Autotag
lua require('nvim-ts-autotag').setup()

" Telescope
lua << EOF
    local telescope = require('telescope')

    telescope.setup({ 
        defaults = { 
            layout_config = { prompt_position = 'top' }, 
            sorting_strategy = 'ascending' 
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = true,
                override_file_sorter = true
            }
        }
    })

    -- Plugins
    telescope.load_extension('fzy_native')
EOF

" Nvim-lint
lua << EOF
    local signs = { Error = '', Warn = '', Hint = '', Info = '' }

    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            signs = true,
            underline = false,
            virtual_text = false,
            update_in_insert = false
        }
    )

    require('lint').linters_by_ft = {
        html = {'tidy'},
        css = {'stylelint'},
        javascript = {'eslint'},
        python = {'pylint'},
        vim = {'vint'}
    }
EOF

" Formatter.nvim
lua << EOF
    require('formatter').setup({ 
        logging = false, 
        filetype = { 
            html = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                stdin = true 
            } end },
            css = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                stdin = true 
            } end },
            javascript = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            javascriptreact = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            typescript = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            typescriptreact = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            svelte = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            vue = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                stdin = true 
            } end },
            json = { function() return { 
                exe = 'prettier', 
                args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                stdin = true 
            } end },
            python = { function() return { 
                exe = 'black',
                args = { '-' },
                stdin = true
            } end },
            lua = { function() return { 
                exe = 'stylua',
                args = { '-' },
                stdin = true
            } end },
            vim = { function() return { 
                exe = 'vint',
                args = { '-' },
                stdin = true
            } end }
        }
    })
EOF

" Pretty Fold
lua require('pretty-fold').setup({})
lua require('pretty-fold.preview').setup({ key = 'l' })

" VGit
lua << EOF
    require('vgit').setup({ 
        settings = { 
            live_blame = {
                enabled = false
            }
        }
    })
EOF

" GitLinker
lua require('gitlinker').setup({ mappings = nil })

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
    \ 'col': float2nr(round(0.08 * &columns)),
    \ 'row': float2nr(round(0.08 * &lines)),
    \ 'style': 'minimal'
\}

" Nvim Tree
lua << EOF
    require('nvim-tree').setup({
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        update_to_buf_dir = {
            enable = true,
            auto_open = false
        }
    })
EOF

let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1 }

" Staline
lua << EOF
    require('staline').setup({
        sections = {
            left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
            mid = {},
            right = {'file_name', 'line_column' }
        },
        mode_colors = {
            i = '#d4be98',
            n = '#84a598',
            c = '#8fbf7f',
            v = '#fc802d',
        },
        defaults = {
            true_colors = true,
            line_column = ' [%l/%L] :%c  ',
            branch_symbol = ' '
        }
    })
EOF

" Nvim Bufferline
lua require('bufferline').setup({})

" Surround Nvim
lua require('surround').setup({})

" Comment
lua require('Comment').setup({ mappings = { basic = false, extra = false, extended = false } })

" Todo Comments
lua require('todo-comments').setup({})

" Which Key
lua << EOF
    require('which-key').setup({ 
        plugins = {
            marks = false,
            registers = false,
            spelling = {
                enabled = false,
                suggestions = 20
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = false,
                windows = true,
                nav = false, 
                z = true,
                g = true
            }
        },
        ignore_missing = false
    })
EOF

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
lua << EOF
    require('which-key').register({ 
        ['<Leader>v'] = { name = 'Vim' },
        ['<Leader>ve'] = { ':e $MYVIMRC<CR>', 'Edit' },
        ['<Leader>vs'] = { ':so $MYVIMRC<CR>', 'Source' },
        ['<Leader>vr'] = { ':Reload<CR>', 'Reload' },
        ['<Leader>vR'] = { ':Restart<CR>', 'Restart' }
    })
EOF

" Write (Save)
nnoremap <Leader>w :update<CR>
nnoremap <Leader>W :wall<CR>

" Plugins

" Trouble
lua << EOF
    require('which-key').register({ 
        ['<Leader>t'] = { name = 'Trouble' },
        ['<Leader>tt'] = { ':TroubleToggle<CR>', 'Toggle' },
        ['<Leader>tr'] = { ':TroubleToggle lsp_references<CR>', 'References LSP' },
        ['<Leader>tw'] = { ':TroubleToggle workspace_diagnostics<CR>', 'Workspace LSP' },
        ['<Leader>td'] = { ':TroubleToggle document_diagnostics<CR>', 'Document LSP' },
        ['<Leader>tT'] = { ':TodoTrouble<CR>', 'Todos' }
    })
EOF

" Nvim LspConfig
lua << EOF
    require('which-key').register({ 
        ['<Leader>l'] = { name = 'LSP Client' },
        ['<Leader>lD'] = { ':Dash<CR>', 'Dash' },
        ['<Leader>ld'] = { ':lua require(\'goto-preview\').goto_preview_definition()<CR>', 'Definition' },
        ['<Leader>lr'] = { ':lua require(\'goto-preview\').goto_preview_references()<CR>', 'References' },
        ['<Leader>li'] = { ':lua require(\'goto-preview\').goto_preview_implementation()<CR>', 'Implementation' },
        ['<Leader>lx'] = { ':lua require(\'goto-preview\').close_all_win()<CR>', 'Close Windows' },
        ['<Leader>lh'] = { ':lua vim.lsp.buf.hover()<CR>', 'Hover' },
        ['<Leader>ls'] = { ':lua vim.lsp.buf.signature_help()<CR>', 'Signature' },
        ['<Leader>la'] = { ':lua vim.lsp.buf.code_action()<CR>', 'Action' },
        ['<Leader>ln'] = { ':lua vim.lsp.buf.rename()<CR>', 'Rename' },
        ['<Leader>lf'] = { ':lua vim.lsp.buf.formatting()<CR>', 'Format LSP' },
        ['<Leader>lF'] = { ':Format<CR>', 'Format' }
    })

    require('which-key').register({ 
        ['<Leader>l'] = { name = 'LSP Client' },
        ['<Leader>lf'] = { ':lua vim.lsp.buf.range_formatting()<CR>', 'Format Range' }
    }, { mode = 'v' })
EOF

nnoremap <silent>[g :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent>]g :lua vim.diagnostic.goto_next()<CR>

" Nvim-spectre
lua << EOF
    require('which-key').register({ 
        ['<Leader>f'] = { name = 'Find & Replace' },
        ['<Leader>fp'] = { ':lua require(\'spectre\').open()<CR>', 'Project-Wide' },
        ['<Leader>fb'] = { ':lua require(\'spectre\').open_file_search()<CR>', 'Buffer' },
        ['<Leader>fw'] = { ':lua require(\'spectre\').open_visual({ select_word = true })<CR>', 'Current Word' }
    })
    
    require('which-key').register({ 
        ['<Leader>f'] = { name = 'Find & Replace' },
        ['<Leader>fw'] = { ':lua require(\'spectre\').open_visual()<CR>', 'Word' }
    }, { mode = 'v' })
EOF

" Telescope
lua << EOF
    require('which-key').register({ 
        ['<Leader>s'] = { name = 'Search' },
        ['<Leader>sf'] = { ':Telescope git_files<CR>', 'Project Files' },
        ['<Leader>sw'] = { ':Telescope live_grep<CR>', 'Project Words' },
        ['<Leader>sW'] = { ':Telescope grep_string<CR>', 'Project Current Word' },
        ['<Leader>sb'] = { ':Telescope buffers<CR>', 'Buffers' },
        ['<Leader>sc'] = { ':Telescope commands<CR>', 'Commands' },
        ['<Leader>sm'] = { ':Telescope marks<CR>', 'Marks' },
        ['<Leader>sr'] = { ':Telescope registers<CR>', 'Registers' },
        ['<Leader>st'] = { ':TodoTelescope<CR>', 'Todos' },
        ['<Leader>sy'] = { ':Telescope neoclip<CR>', 'Clipboard' },
        ['<Leader>sg'] = { name = 'Git' },
        ['<Leader>sgc'] = { ':Telescope git_bcommits<CR>', 'Commits' },
        ['<Leader>sgC'] = { ':Telescope git_commits<CR>', 'Project Commits' },
        ['<Leader>sgb'] = { ':Telescope git_branches<CR>', 'Branches' }
    })
EOF

" VGit & Neogit & GitLinker
lua << EOF
    require('which-key').register({ 
        ['<Leader>g'] = { name = 'Git' },
        ['<Leader>gs'] = { ':Neogit<CR>', 'Status (Neogit)' },
        ['<Leader>gb'] = { ':VGit toggle_live_blame<CR>', 'Blame Toggle' },
        ['<Leader>gh'] = { name = 'Hunk' },
        ['<Leader>ght'] = { ':VGit toggle_live_gutter<CR>', 'Toggle' },
        ['<Leader>ghp'] = { ':VGit buffer_hunk_preview<CR>', 'Preview' },
        ['<Leader>ghr'] = { ':VGit buffer_hunk_reset<CR>', 'Reset' },
        ['<Leader>gd'] = { name = 'Diff' },
        ['<Leader>gdd'] = { ':VGit buffer_diff_preview<CR>', 'Diff' },
        ['<Leader>gdD'] = { ':DiffviewOpen HEAD<CR>', 'Diffview' },
        ['<Leader>gdb'] = { ':VGit buffer_diff_preview<CR>', 'Buffer Preview' },
        ['<Leader>gdh'] = { ':VGit buffer_history_preview<CR>', 'Buffer History' },
        ['<Leader>gdr'] = { ':VGit buffer_reset<CR>', 'Buffer Reset' },
        ['<Leader>gl'] = { name = 'Linker' },
        ['<Leader>gly'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'n\')<CR>', 'Yank' },
        ['<Leader>glO'] = { ':lua require(\'gitlinker\').get_repo_url({ action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Project' },
        ['<Leader>glo'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'n\', { action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Selected' }
    })
    
    require('which-key').register({ 
        ['<Leader>g'] = { name = 'Git' },
        ['<Leader>gly'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'v\')<CR>', 'Yank' },
        ['<Leader>glo'] = { ':lua require(\'gitlinker\').get_buf_range_url(\'v\', { action_callback = require(\'gitlinker.actions\').open_in_browser })<CR>', 'Open Selected' }
    }, { mode = 'v' })
EOF

nnoremap <silent>[h :VGit hunk_up<CR>
nnoremap <silent>]h :VGit hunk_down<CR>

" Package Info
lua << EOF
    require('which-key').register({ 
        ['<Leader>p'] = { name = 'Package Info' },
        ['<Leader>pu'] = { ':lua require(\'package-info\').update()<CR>', 'Update Package' },
        ['<Leader>pd'] = { ':lua require(\'package-info\').delete()<CR>', 'Delete Package' },
        ['<Leader>pi'] = { ':lua require(\'package-info\').install()<CR>', 'Install New Package' },
        ['<Leader>pr'] = { ':lua require(\'package-info\').reinstall()<CR>', 'Reinstall Dependencies' },
        ['<Leader>pv'] = { ':lua require(\'package-info\').change_version()<CR>', 'Install Different Version' }
    })
EOF

" FM Nvim
lua require('which-key').register({ ['<Leader>r'] = { ':RnvimrToggle<CR>', 'Ranger' } })

" Nvim Tree
lua require('which-key').register({ ['<Leader>e'] = { ':NvimTreeToggle<CR>', 'NvimTree' } })

" Nvim Bufferline
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>[t :BufferLineMovePrev<CR>
nnoremap <silent>]t :BufferLineMoveNext<CR>

" Comment
lua << EOF
    require('which-key').register({ 
        ['<Leader>c'] = { name = 'Comment' },
        ['<Leader>cc'] = { ':lua require(\'Comment.api\').toggle_current_linewise()<CR>', 'Comment current line' },
        ['<Leader>cb'] = { ':lua require(\'Comment.api\').toggle_current_blockwise()<CR>', 'Comment current line blockwise' }
    })
    
    require('which-key').register({ 
        ['<Leader>c'] = { name = 'Comment' },
        ['<Leader>cc'] = { ':lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>', 'Comment selection' },
        ['<Leader>cb'] = { ':lua require(\'Comment.api\').toggle_blockwise_op(vim.fn.visualmode())<CR>', 'Comment selection blockwise' }
    }, { mode = 'v' })
EOF

" }}}

" Functions
" {{{ -------------------------------------------------------------------------

" Plugins

" Nvim-lint
" Autocmd to trigger linting - InsertLeave or TextChanged events
augroup lint
    au BufWritePost <buffer> lua require('lint').try_lint()
augroup END

" vim:foldmethod=marker
