return {
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                theme = "nord",
                globalstatus = true,
                section_separators = "",
                component_separators = "",
            },
        },
    },
}
