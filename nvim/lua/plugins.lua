require('packer').startup(function()
    -- Packer can manage itself
    -- https://github.com/wbthomason/packer.nvim#specifying-plugins
    use('wbthomason/packer.nvim')

    -- Themes
    use({ 'shaunsingh/nord.nvim', config = get_config('nord') })

    -- Language
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_config('treesitter') })
    use({ 'neovim/nvim-lspconfig', config = get_config('lsp') })

    use({ 'folke/trouble.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
    use({ 'rmagatti/goto-preview', config = get_config('goto-preview') }) -- Previewing native LSP's goto definition calls

    -- Completion
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            { 'tzachar/cmp-tabnine', run = './install.sh' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        },
        config = get_config('cmp'),
    })
    use('onsails/lspkind-nvim')

    -- Search
    use({'rktjmp/highlight-current-n.nvim', config = get_config('highlight')})
    use({ 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } })

    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
        config = get_config('telescope'),
    })
    use({ 'nvim-telescope/telescope-fzy-native.nvim' })

    -- Code display
    use({ 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls') })
    use({ 'anuvyklack/pretty-fold.nvim', config = get_config('pretty-fold') })

    -- Integrations
    use({ 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim' } })
    use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = get_config('gitsigns') })

    use({ 'vuki656/package-info.nvim', requires = { 'MunifTanjim/nui.nvim' }, config = get_config('package-info') })

    -- Interface
    use({ 'goolord/alpha-nvim', config = get_config('alpha') })
    use({ 'folke/zen-mode.nvim', config = get_config('zen-mode') })
    use({ 'yamatsum/nvim-nonicons', requires = { 'kyazdani42/nvim-web-devicons' } })

    use({ 'kevinhwang91/rnvimr', config = get_config('rnvimr') })
    use({ 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, config = get_config('nvim-tree') })

    use({ 'tamton-aquib/staline.nvim', config = get_config('staline') })
    use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = get_config('bufferline') })

    -- Commands
    use({ 'blackcauldron7/surround.nvim', config = get_config('surround') })
    use({ 'numToStr/Comment.nvim', config = get_config('comment') })
    use({ 'folke/todo-comments.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = get_config('todo') })

    -- Other
    use('famiu/bufdelete.nvim')
    use({ 'nathom/filetype.nvim', config = get_config('filetype') }) -- Easily speed up your neovim startup time!
    use({ 'folke/which-key.nvim', config = get_config('which-key') })
end)

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
    'gzip',
    'man',
    'matchit',
    'matchparen',
    'shada_plugin',
    'tarPlugin',
    'tar',
    'zipPlugin',
    'zip',
    'netrwPlugin',
}
for i = 1, 10 do
    vim.g['loaded_' .. disabled_built_ins[i]] = 1
end
