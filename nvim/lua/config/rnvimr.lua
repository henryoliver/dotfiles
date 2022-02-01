vim.g.rnvimr_enable_ex = 1 -- Enable Ranger to replace builtin Netrw to be a file explorer.
vim.g.rnvimr_enable_bw = 1 -- Make Neovim automatically execute |bwipeout| to wipe out the buffers deleted by Ranger.

vim.g.rnvimr_enable_picker = 1 -- Enable Ranger to be hidden after picking a file.
vim.g.rnvimr_hide_gitignore = 1 -- Make Ranger to hide the files included in gitignore when show_hidden=False in Ranger.

vim.g.rnvimr_draw_border = 1 -- Using builtin curses in Ranger to draw a border for the floating window.
-- vim.g.rnvimr_border_attr = { fg = 14, bg = -1 } -- Change the border's color integer value is [-1, 255].
vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"' -- Set up only two columns
