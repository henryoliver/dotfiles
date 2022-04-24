-- Remove all trailing whitespace on save
vim.api.nvim_exec(
    [[
    augroup TrimWhiteSpace
        au!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
    ]],
    false
)

-- Prevent new line to also start with a comment
vim.api.nvim_exec(
    [[
    augroup NewLineComment
        autocmd!
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    augroup END
    ]],
    false
)

-- Plugins

-- Highlight Current N
vim.api.nvim_exec(
    [[
    augroup ClearSearchHL
	autocmd!
	" You may only want to see hlsearch /while/ searching, you can automatically
	" toggle hlsearch with the following autocommands
	autocmd CmdlineEnter /,\? set hlsearch
	autocmd CmdlineLeave /,\? set nohlsearch
	" this will apply similar n|N highlighting to the first search result
	" careful with escaping ? in lua, you may need \\?
	autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
    augroup END
    ]],
    false
)
