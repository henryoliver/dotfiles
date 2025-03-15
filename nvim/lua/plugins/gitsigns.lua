return {
    ---@type LazySpec
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
        -- Navigation
        {
            "]h",
            function()
                return require("gitsigns").next_hunk()
            end,
            desc = "Next hunk",
        },
        {
            "[h",
            function()
                return require("gitsigns").prev_hunk()
            end,
            desc = "Previous hunk",
        },
        -- Actions
        {
            "<Leader>ghs",
            function()
                return require("gitsigns").stage_hunk()
            end,
            desc = "Stage hunk",
        },
        {
            "<Leader>ghr",
            function()
                return require("gitsigns").reset_hunk()
            end,
            desc = "Reset hunk",
        },
        {
            "<Leader>ghS",
            function()
                return require("gitsigns").stage_buffer()
            end,
            desc = "Stage buffer",
        },
        {
            "<Leader>ghR",
            function()
                return require("gitsigns").reset_buffer()
            end,
            desc = "Reset buffer",
        },
        {
            "<Leader>ghp",
            function()
                return require("gitsigns").preview_hunk()
            end,
            desc = "Preview hunk",
        },
        {
            "<Leader>ghi",
            function()
                return require("gitsigns").preview_hunk_inline()
            end,
            desc = "Preview hunk inline",
        },
        {
            "<Leader>ghb",
            function()
                return require("gitsigns").blame_line({ full = true })
            end,
            desc = "Blame line (full)",
        },
        {
            "<Leader>ghd",
            function()
                return require("gitsigns").diffthis()
            end,
            desc = "Diff this",
        },
        {
            "<Leader>ghD",
            function()
                return require("gitsigns").diffthis("~")
            end,
            desc = "Diff with ~",
        },
        -- Toggles
        {
            "<Leader>gtb",
            function()
                return require("gitsigns").toggle_current_line_blame()
            end,
            desc = "Toggle current line blame",
        },
        {
            "<Leader>gtd",
            function()
                return require("gitsigns").toggle_deleted()
            end,
            desc = "Toggle show deleted",
        },
        {
            "<Leader>gtw",
            function()
                return require("gitsigns").toggle_word_diff()
            end,
            desc = "Toggle word diff",
        },
    },
}
