-- Enable the colorscheme
vim.cmd([[colorscheme nord]])

vim.g.nord_bold = true
vim.g.nord_italic = true

vim.g.nord_borders = true
vim.g.nord_contrast = true

vim.g.nord_cursorline_transparent = true

vim.g.nord_disable_background = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_enable_sidebar_background = true

-- Load the colorscheme
require("nord").set()

-- Custom global colors
local nord = require("nord.colors")

-- Search highlights
vim.api.nvim_set_hl(0, "Search", { fg = nord.nord6_gui, bg = nord.nord3_gui })
vim.api.nvim_set_hl(0, "IncSearch", { fg = nord.nord6_gui, bg = nord.nord3_gui })
vim.api.nvim_set_hl(0, "Substitute", { fg = nord.nord6_gui, bg = nord.nord1_gui, bold = true })

-- Auto complete menu
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = nord.nord3_gui_bright, bg = nord.none, italic = true })

-- Diff view
vim.api.nvim_set_hl(0, "DiffAdd", { fg = nord.nord14_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffChange", { fg = nord.nord13_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = nord.nord11_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffText", { fg = nord.nord15_gui, bg = nord.nord1_gui, bold = true })

-- Neogit
-- vim.api.nvim_set_hl(0, "NeogitNotificationInfo", { fg = nord.nord14_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitNotificationWarning", { fg = nord.nord14_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitNotificationError", { fg = nord.nord14_gui, bg = nord.nord1_gui, bold = true })

-- vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = nord.nord11_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { fg = nord.nord13_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = nord.nord11_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitHunkHeader", { fg = nord.nord15_gui, bg = nord.nord1_gui, bold = true })
-- vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { fg = nord.nord15_gui, bg = nord.nord1_gui, bold = true })
