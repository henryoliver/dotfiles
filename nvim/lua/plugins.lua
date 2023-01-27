-- Returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
    return string.format('require("config/%s")', name)
end

require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Themes
    use({ "shaunsingh/nord.nvim", config = get_config("nord") })

    -- Language
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_config("treesitter") })
    use({ "williamboman/mason.nvim", requires = { "williamboman/mason-lspconfig.nvim" }, config = get_config("mason") })
    use({ "neovim/nvim-lspconfig", event = "BufReadPre", config = get_config("lsp") })

    use({ "rmagatti/goto-preview", config = get_config("goto-preview") })
    use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })
    use({
        "mxsdev/nvim-dap-vscode-js",
        requires = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = get_config("dap"),
    })
    use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons", config = get_config("trouble") })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "tzachar/cmp-tabnine", run = "./install.sh" },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = get_config("cmp"),
    })

    use({ "windwp/nvim-ts-autotag", config = get_config("autotag") })
    use({ "windwp/nvim-autopairs", config = get_config("autopairs") })

    -- Search
    use({ "windwp/nvim-spectre", requires = "nvim-lua/plenary.nvim" })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
        config = get_config("telescope"),
    })

    -- Code display
    use("gpanders/editorconfig.nvim")
    use({ "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline") })
    use({ "norcalli/nvim-colorizer.lua", config = get_config("colorizer") })

    -- Interface
    use("onsails/lspkind-nvim") -- Pictograms to neovim built-in lsp
    use({ "yamatsum/nvim-nonicons", requires = "nvim-tree/nvim-web-devicons" })

    use({ "folke/twilight.nvim", config = get_config("twilight") })
    use({ "folke/zen-mode.nvim", config = get_config("zen-mode") })

    use({ "kevinhwang91/rnvimr", config = get_config("rnvimr") })
    use({ "kyazdani42/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons", config = get_config("nvim-tree") })

    use({ "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons", config = get_config("lualine") })
    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons",
        config = get_config("bufferline"),
    })

    -- Commands
    use({ "max397574/better-escape.nvim", config = get_config("escape") })
    use({
        "numToStr/Comment.nvim",
        requires = "JoosepAlviste/nvim-ts-context-commentstring",
        config = get_config("comment"),
    })

    use({ "ur4ltz/surround.nvim", config = get_config("surround") })
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = get_config("todo") })

    -- Integrations
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim", config = get_config("neogit") })
    use({ "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim", config = get_config("gitlinker") })
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", config = get_config("diffview") })
    use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim", config = get_config("gitsigns") })

    use({ "akinsho/toggleterm.nvim", tag = "*", config = get_config("toggleterm") })
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = get_config("chatgpt"),
    })

    -- Others
    use("famiu/bufdelete.nvim")
    use("LunarVim/bigfile.nvim") -- Disables certain features if the opened file is big
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
