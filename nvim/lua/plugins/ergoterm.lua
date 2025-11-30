return {
    "waiting-for-dev/ergoterm.nvim",
    event = "VeryLazy",
    opts = {
        picker = "telescope", -- Explicitly configure telescope as picker
        layout = "float",
        float_opts = {
            border = "single",
            height = 0.9,
            width = 0.9,
            relative = "editor",
            style = "minimal",
            row = 0.02, -- Position closer to top (2% from top)
            col = 0.05, -- Center horizontally with offset
        },
        float_winblend = 0,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        start_in_insert = true,
        auto_scroll = true,
        persist_size = true,
    },
    keys = {
        { "<Leader>tt", "<Cmd>TermNew layout=float<CR>", desc = "Terminal Float" },
        { "<Leader>ts", "<Cmd>TermNew layout=below<CR>", desc = "Terminal Split" },
        { "<Leader>tv", "<Cmd>TermNew layout=right<CR>", desc = "Terminal Vertical" },
        { "<Leader>tl", "<Cmd>TermList<CR>", desc = "Terminal List" },
    },
}
