return {
    -- Nord
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
        -- Custom global colors
        local nord = require("nord")
        local colors = require("nord.colors")

        -- Load the colorscheme
        nord.set()

        vim.g.nord_bold = true
        vim.g.nord_italic = true

        vim.g.nord_borders = true
        vim.g.nord_contrast = true

        vim.g.nord_cursorline_transparent = true

        vim.g.nord_disable_background = true
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_enable_sidebar_background = true

        -- https://github.com/shaunsingh/nord.nvim/blob/master/lua/nord/colors.lua
        -- Search highlights
        vim.api.nvim_set_hl(0, "Search", { bg = colors.nord3_gui })
        vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.nord3_gui })
        vim.api.nvim_set_hl(0, "CurSearch", { bg = colors.nord3_gui })
        vim.api.nvim_set_hl(0, "Substitute", { bg = colors.nord3_gui_bright, bold = true })

        vim.api.nvim_set_hl(0, "MsgArea", { fg = colors.nord9_gui, bold = true })
        -- vim.api.nvim_set_hl(0, "Folded", { fg = colors.nord1_gui, bg = colors.nord1_gui, italic = true })
        -- vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.nord1_gui, bg = colors.nord1_gui, italic = true })

        -- Diff view
        vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.nord14_gui, bg = colors.none, bold = true })
        vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.nord13_gui, bg = colors.none, bold = true })
        vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.nord11_gui, bg = colors.none, bold = true })
        vim.api.nvim_set_hl(0, "DiffText", { fg = colors.nord15_gui, bg = colors.none, bold = true })
    end
}
