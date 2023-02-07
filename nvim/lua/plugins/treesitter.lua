return {
    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = "TSUpdateSync",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                auto_install = true,

                highlight = { enable = true },
                indent = { enable = true },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-l>",
                        scope_incremental = "<C-l>",
                        node_incremental = "<C-j>",
                        node_decremental = "<C-k>",
                    },
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            })
        end,
    },
}
