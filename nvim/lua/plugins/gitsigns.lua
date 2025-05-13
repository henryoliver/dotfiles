return {
    ---@type LazySpec
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")
        local colors = require("nord.colors").palette

        gitsigns.setup({
            signs = {
                delete = { text = "⁚" }, -- ": ⁚ ⁝ ⁞"
                topdelete = { text = "⁚" },
                changedelete = { text = "⁝" },
                untracked = { text = "¦" },
            },
            signs_staged = {
                delete = { text = "⁚" }, -- ": ⁚ ⁝ ⁞"
                topdelete = { text = "⁚" },
                changedelete = { text = "⁝" },
                untracked = { text = "¦" },
            },
        })

        -- Highlights
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsUntrackedNr", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsUntrackedLn", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsAddCul", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangeCul", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteCul", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangedeleteCul", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsTopdeleteCul", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsUntrackedCul", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(
            0,
            "GitSignsCurrentLineBlame",
            { fg = colors.polar_night.brightest, bg = colors.polar_night.bright }
        )
        vim.api.nvim_set_hl(0, "GitSignsAddPreview", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeletePreview", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsAddInline", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangeInline", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsAddLnInline", { fg = colors.frost.ice, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsChangeLnInline", { fg = colors.aurora.yellow, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteLnInline", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteVirtLn", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "GitSignsDeleteVirtLnInLine", { fg = colors.aurora.red, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(
            0,
            "GitSignsVirtLnum",
            { fg = colors.polar_night.brightest, bg = colors.polar_night.bright }
        )

        -- Staged highlights
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedAdd",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChange",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedDelete",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangedelete",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedTopdelete",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedUntracked",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedAddNr",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangeNr",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedDeleteNr",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangedeleteNr",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedTopdeleteNr",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedUntrackedNr",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedAddLn",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangeLn",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangedeleteLn",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedTopdeleteLn",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedUntrackedLn",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedAddCul",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangeCul",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedDeleteCul",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedChangedeleteCul",
            { fg = colors.aurora.yellow, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedTopdeleteCul",
            { fg = colors.aurora.red, bg = colors.polar_night.bright, blend = 50 }
        )
        vim.api.nvim_set_hl(
            0,
            "GitSignsStagedUntrackedCul",
            { fg = colors.frost.ice, bg = colors.polar_night.bright, blend = 50 }
        )
    end,
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
