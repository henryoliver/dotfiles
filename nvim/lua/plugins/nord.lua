return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true, -- Enable this to disable setting the background color
            diff = { mode = "none" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
            errors = { mode = "none" }, -- Display mode for errors and diagnostics values : [bg|fg|none]
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/defaults.lua
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/colors.lua
            on_highlights = function(highlights, colors)
                highlights.Search = { bg = colors.polar_night.brightest }
                highlights.IncSearch = { bg = colors.polar_night.brightest }
                highlights.CurSearch = { bg = colors.polar_night.brightest }
                highlights.Substitute = { bg = colors.polar_night.brightest_bright, bold = true }

                highlights.ErrorMsg = { bg = colors.none, fg = colors.aurora.red }
                highlights.WarningMsg = { bg = colors.none, fg = colors.aurora.yellow }

                highlights.Folded = { bg = colors.none, fg = colors.polar_night.bright }

                -- VimDiff
                highlights.DiffText = { bg = colors.none, fg = colors.polar_night.brightest } -- DiffText guifg=#81a1c1 guibg=#3b4252
                highlights.DiffAdd = { bg = colors.none, fg = colors.frost.ice } -- DiffAdd guifg=#a3be8c guibg=#3b4252
                highlights.DiffChange = { bg = colors.none, fg = colors.aurora.yellow } -- DiffChange guifg=#ebcb8b guibg=#3b4252
                highlights.DiffDelete = { bg = colors.none, fg = colors.aurora.red } -- DiffDelete guifg=#bf616a guibg=#3b4252
                highlights.DiffviewFilePanelInsertions = { bg = colors.none, fg = colors.frost.ice } -- DiffviewFilePanelInsertions xxx guifg=#a3be8c
                highlights.DiffviewStatusModified = { bg = colors.none, fg = colors.aurora.yellow } -- DiffviewStatusModified guifg=#ebcb8b
                highlights.DiffviewFilePanelDeletions = { bg = colors.none, fg = colors.aurora.red } -- DiffviewFilePanelDeletions guifg=#bf616a
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
