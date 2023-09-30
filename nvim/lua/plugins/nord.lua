return {
    -- Nord
    "gbprod/nord.nvim",
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = false, -- Enable this to disable setting the background color
            diff = { mode = "fg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
            errors = { mode = "fg" }, -- Display mode for errors and diagnostics values : [bg|fg|none]
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/defaults.lua
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/colors.lua
            on_highlights = function(highlights, colors)
                highlights.Search = { bg = colors.polar_night.brightest }
                highlights.IncSearch = { bg = colors.polar_night.brightest }
                highlights.CurSearch = { bg = colors.polar_night.brightest }
                highlights.Substitute = { bg = colors.polar_night.brightest_bright, bold = true }

                highlights.ErrorMsg = { bg = colors.none, fg = colors.aurora.red }
                highlights.WarningMsg = { bg = colors.none, fg = colors.aurora.yellow }

                highlights.Folded = { bg = colors.none }
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
