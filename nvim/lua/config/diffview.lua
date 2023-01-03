local actions = require("diffview.actions")

require("diffview").setup({
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
    git_cmd = { "git" }, -- The git executable followed by default args.
    use_icons = true, -- Requires nvim-web-devicons
})

-- DiffAdd        xxx ctermbg=4 gui=reverse guifg=#a3be8c
-- DiffDelete     xxx ctermfg=12 ctermbg=6 gui=reverse guifg=#bf616a
-- DiffChange     xxx ctermbg=5 gui=reverse guifg=#ebcb8b
-- DiffText       xxx cterm=bold ctermbg=9 gui=reverse guifg=#b48ead

-- vim.highlight.create('DiffAdd', {ctermbg=0, guibg=lightgrey}, false)

