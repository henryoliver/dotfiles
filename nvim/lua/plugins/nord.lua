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

                highlights.DiffviewFilePanelInsertions = { bg = colors.none, fg = colors.frost.ice }
                highlights.DiffviewStatusModified = { bg = colors.none, fg = colors.aurora.yellow }
                highlights.DiffviewFilePanelDeletions = { bg = colors.none, fg = colors.aurora.red }

                -- 🪟 Float transparency
                highlights.NormalFloat = { bg = colors.none }
                highlights.FloatBorder = { bg = colors.none, fg = colors.polar_night.brighter }
                highlights.FloatTitle = { bg = colors.none } -- optional: for titled floats
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
