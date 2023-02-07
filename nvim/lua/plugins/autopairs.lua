return {
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = "hrsh7th/nvim-cmp",
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
