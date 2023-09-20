return {
    -- Nord
    "gbprod/nord.nvim",
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true,         -- Enable this to disable setting the background color
            diff = { mode = "fg" },     -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
            errors = { mode = "none" }, -- Display mode for errors and diagnostics values : [bg|fg|none]
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/defaults.lua
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/colors.lua
            on_highlights = function(highlights, colors)
                highlights.IncSearch = { fg = colors.snow_storm.brightest, bg = colors.frost.ice }

                highlights.Search = { bg = colors.polar_night.brightest }
                highlights.IncSearch = { bg = colors.polar_night.brightest }
                highlights.CurSearch = { bg = colors.polar_night.brightest }
                highlights.Substitute = { bg = colors.polar_night.brightest_bright, bold = true }

                highlights.MsgArea = { fg = colors.frost.artic_water, bold = true }
                highlights.Folded = { fg = colors.polar_night.bright, bg = colors.polar_night.bright, italic = true }
                highlights.StatusLine = { fg = colors.polar_night.bright, bg = colors.polar_night.bright, italic = true }

                -- Diff view
                -- highlights.DiffAdd = { fg = colors.aurora.green, bg = colors.none, bold = true }
                -- highlights.DiffChange = { fg = colors.aurora.yellow, bg = colors.none, bold = true }
                -- highlights.DiffDelete = { fg = colors.aurora.red, bg = colors.none, bold = true }
                -- highlights.DiffText = { fg = colors.aurora.purple, bg = colors.none, bold = true }

                -- Cmp
                highlights.CmpItemKindTabNine = { fg = colors.frost.artic_water }

                -- Telescope
                highlights.TelescopeSelection = { fg = colors.none, bg = colors.polar_night.bright }
                highlights.TelescopeMatching = { fg = colors.frost.artic_water }
                highlights.TelescopeBorder = { fg = colors.polar_night.brightest_bright }
                highlights.TelescopePromptBorder = { fg = colors.polar_night.brightest_bright }
                highlights.TelescopeResultsBorder = { fg = colors.polar_night.brightest_bright }
                highlights.TelescopePreviewBorder = { fg = colors.polar_night.brightest_bright }

                -- Tree
                highlights.NvimTreeGitNew = { fg = colors.frost.artic_water }
                highlights.NvimTreeGitDirty = { fg = colors.frost.polar_water }
                highlights.NvimTreeGitStaged = { fg = colors.frost.artic_ocean }
                highlights.NvimTreeGitMerge = { fg = colors.aurora.red }
                highlights.NvimTreeGitRenamed = { fg = colors.aurora.orange }
                highlights.NvimTreeGitDeleted = { fg = colors.aurora.green }
                highlights.NvimTreeGitIgnored = { fg = colors.aurora.purple }
                highlights.NvimTreeModifiedFile = { fg = colors.none }
                highlights.NvimTreeOpenedFile = { fg = colors.none }
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
