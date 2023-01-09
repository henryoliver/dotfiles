local nord = require("nord.colors")
local actions = require("diffview.actions")

require("diffview").setup({
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
    git_cmd = { "git" }, -- The git executable followed by default args.
    use_icons = true, -- Requires nvim-web-devicons
})

vim.api.nvim_set_hl(0, "DiffAdd", { fg = nord.nord14_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffChange", { fg = nord.nord13_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = nord.nord11_gui, bg = nord.nord1_gui, bold = true })
vim.api.nvim_set_hl(0, "DiffText", { fg = nord.nord15_gui, bg = nord.nord1_gui, bold = true })
