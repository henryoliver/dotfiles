return {
    -- WhichKey
    {
        "folke/which-key.nvim",
        opts = {
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = false },
                presets = {
                    motions = true,
                    operators = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            icons = {
                breadcrumb = "", -- symbol used in the command line area that shows your active key combo
                separator = "", -- symbol used between a key and it's label
                group = " ", -- symbol prepended to a group
            },
            window = {
                border = "none", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 20 }, -- min and max height of the columns
                width = { min = 20, max = 60 }, -- min and max width of the columns
                spacing = 8, -- spacing between columns
                align = "left", -- align columns left, center or right
            },
            ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = false, -- show help message on the command line when the popup is visible
            triggers = "auto", -- automatically setup triggers
        },
    },
}
