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
