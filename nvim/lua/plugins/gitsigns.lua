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
        -- Preview
        {
            "<Leader>ghr",
            function()
                return require("gitsigns").reset_hunk()
            end,
            desc = "Reset",
        },
        {
            "<Leader>ghp",
            function()
                return require("gitsigns").preview_hunk()
            end,
            desc = "Preview",
        },
        {
            "<Leader>ghi",
            function()
                return require("gitsigns").preview_hunk_inline()
            end,
            desc = "Preview Inline",
        },
        -- Blame
        {
            "<Leader>gb",
            function()
                return require("gitsigns").toggle_current_line_blame()
            end,
            desc = "Blame",
        },
    },
}
