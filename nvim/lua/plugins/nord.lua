return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true, -- Disable setting the background color
            diff = { mode = "bg" },
            errors = { mode = "none" },
            on_highlights = function(highlights, colors)
                -- https://github.com/gbprod/nord.nvim/blob/main/lua/nord/colors.lua
                local diff_add_bg = colors.polar_night.origin
                local diff_change_bg = colors.polar_night.bright
                local diff_delete_bg = colors.polar_night.brighter
                local diff_text_bg = colors.polar_night.brightest

                -- Search highlights
                highlights.Search = { bg = colors.polar_night.brightest }
                highlights.IncSearch = { bg = colors.polar_night.brightest }
                highlights.CurSearch = { bg = colors.polar_night.brightest }
                highlights.Substitute = { bg = colors.polar_night.brightest_bright, bold = true }

                -- Messages
                highlights.ErrorMsg = { bg = colors.none, fg = colors.aurora.red }
                highlights.WarningMsg = { bg = colors.none, fg = colors.aurora.yellow }

                -- UI elements
                highlights.Folded = { bg = colors.none, fg = colors.polar_night.bright }

                -- Built-in diff highlights
                highlights.DiffAdd = { bg = diff_add_bg, fg = colors.frost.ice }
                highlights.DiffChange = { bg = diff_change_bg, fg = colors.aurora.yellow }
                highlights.DiffDelete = { bg = diff_delete_bg, fg = colors.aurora.red }
                highlights.DiffText = { bg = diff_text_bg, fg = colors.frost.snow_storm, bold = true }
                highlights.DiffAdded = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffRemoved = { bg = colors.none, fg = colors.aurora.red }
                highlights.DiffChanged = { bg = colors.none, fg = colors.aurora.yellow }
                highlights.DiffOldFile = { bg = colors.none, fg = colors.aurora.red }
                highlights.DiffNewFile = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffFile = { bg = colors.none, fg = colors.frost.artic_water, bold = true }
                highlights.DiffLine = { bg = colors.none, fg = colors.frost.artic_water }
                highlights.DiffIndexLine = { bg = colors.none, fg = colors.polar_night.brightest, bold = true }

                -- Diffview
                highlights.DiffviewFilePanelInsertions = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffviewFilePanelDeletions = { bg = colors.none, fg = colors.aurora.red }
                highlights.DiffviewStatusAdded = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffviewStatusDeleted = { bg = colors.none, fg = colors.aurora.red }
                highlights.DiffviewStatusModified = { bg = colors.none, fg = colors.aurora.yellow }
                highlights.DiffviewStatusRenamed = { bg = colors.none, fg = colors.frost.artic_water }
                highlights.DiffviewStatusUntracked = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffviewFolderName = { bg = colors.none, fg = colors.frost.artic_water }
                highlights.DiffviewNormal = { bg = colors.none, fg = colors.snow_storm.origin }
                highlights.DiffviewCursorLine = { bg = colors.polar_night.bright }
                highlights.DiffviewVertSplit = { bg = colors.none, fg = colors.polar_night.brighter }
                highlights.DiffviewSignColumn = { bg = colors.none }

                -- Git signs and inline previews
                highlights.GitSignsAdd = { bg = colors.none, fg = colors.frost.ice }
                highlights.GitSignsChange = { bg = colors.none, fg = colors.aurora.yellow }
                highlights.GitSignsDelete = { bg = colors.none, fg = colors.aurora.red }
                highlights.GitSignsChangedelete = { bg = colors.none, fg = colors.aurora.yellow }
                highlights.GitSignsTopdelete = { bg = colors.none, fg = colors.aurora.red }
                highlights.GitSignsUntracked = { bg = colors.none, fg = colors.frost.ice }

                -- 🪟 Float transparency
                highlights.NormalFloat = { bg = colors.none }
                highlights.FloatBorder = { bg = colors.none, fg = colors.polar_night.brighter }
                highlights.FloatTitle = { bg = colors.none } -- optional: for titled floats
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
