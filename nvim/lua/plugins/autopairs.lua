return {
    -- Autopairs
    -- A super powerful autopair plugin for Neovim that supports multiple characters.
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp" },
        opts = {
            check_ts = true,
            disable_filetype = { "TelescopePrompt", "vim" },
            ts_config = {
                javascript = { "template_string" },
            },
            enable_check_bracket_line = false,
        },
    },
}
