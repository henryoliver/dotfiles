local spec = {
    "shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
}

function spec:config()
    -- Custom global colors
    local nord = require("nord")
    local colors = require("nord.colors")

    vim.g.nord_bold = true
    vim.g.nord_italic = true

    vim.g.nord_borders = true
    vim.g.nord_contrast = true

    vim.g.nord_cursorline_transparent = true

    vim.g.nord_disable_background = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_enable_sidebar_background = true

    -- Search highlights
    vim.api.nvim_set_hl(0, "Search", { fg = colors.nord6_gui, bg = colors.nord3_gui })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.nord6_gui, bg = colors.nord3_gui })
    vim.api.nvim_set_hl(0, "Substitute", { fg = colors.nord6_gui, bg = colors.nord1_gui, bold = true })

    -- Auto complete menu
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.nord3_gui_bright, bg = colors.none, italic = true })

    -- Diff view
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.nord14_gui, bg = colors.nord1_gui, bold = true })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.nord13_gui, bg = colors.nord1_gui, bold = true })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.nord11_gui, bg = colors.nord1_gui, bold = true })
    vim.api.nvim_set_hl(0, "DiffText", { fg = colors.nord15_gui, bg = colors.nord1_gui, bold = true })

    -- Load the colorscheme
    nord.set()
end

return spec
