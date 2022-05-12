-- Returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
    return string.format('require("config/%s")', name)
end

require("packer").startup(function(use)
    -- Packer can manage itself
    -- https://github.com/wbthomason/packer.nvim#specifying-plugins
    use("wbthomason/packer.nvim")

    -- Themes
    use({ "shaunsingh/nord.nvim", config = get_config("nord") })

    -- Language
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_config("treesitter") })
    use({ "neovim/nvim-lspconfig", config = get_config("lsp") })

    use({ "folke/trouble.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use({ "rmagatti/goto-preview", config = get_config("goto-preview") }) -- Previewing native LSP's goto definition calls

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "tzachar/cmp-tabnine", run = "./install.sh" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
        },
        config = get_config("cmp"),
    })

    use("onsails/lspkind-nvim") -- Pictograms to neovim built-in lsp
    use({ "windwp/nvim-ts-autotag", config = get_config("autotag") })
    use({ "windwp/nvim-autopairs", config = get_config("autopairs") })

    -- Search
    use("rktjmp/highlight-current-n.nvim")
    use({ "windwp/nvim-spectre", requires = { "nvim-lua/plenary.nvim" } })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = get_config("telescope"),
    })
    use({ "nvim-telescope/telescope-fzy-native.nvim" })

    -- Code display
    use("gpanders/editorconfig.nvim")
    use({ "norcalli/nvim-colorizer.lua", config = get_config("colorizer") })
    use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })
    use({
        "anuvyklack/pretty-fold.nvim",
        requires = "anuvyklack/nvim-keymap-amend", -- only for preview
        config = get_config("pretty-fold"),
    })

    -- Integrations
    use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("gitsigns") })

    use({ "vuki656/package-info.nvim", requires = { "MunifTanjim/nui.nvim" }, config = get_config("package-info") })

    -- Interface
    use({ "folke/zen-mode.nvim", config = get_config("zen-mode") })
    use({ "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" } })

    use({ "kevinhwang91/rnvimr", config = get_config("rnvimr") })
    use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, config = get_config("nvim-tree") })

    use({ "tamton-aquib/staline.nvim", config = get_config("staline") })
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" }, config = get_config("bufferline") })

    -- Commands
    use({ "Pocco81/AutoSave.nvim", config = get_config("autosave") })
    use({ "ur4ltz/surround.nvim", config = get_config("surround") })
    use({ "numToStr/Comment.nvim", config = get_config("comment") })
    use({ "folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("todo") })

    -- Other
    use("famiu/bufdelete.nvim")
    use({ "nathom/filetype.nvim", config = get_config("filetype") }) -- Easily speed up your neovim startup time!
    use({ "folke/which-key.nvim", config = get_config("which-key") })
end)

-- Disable some built-in plugins we don't want
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
