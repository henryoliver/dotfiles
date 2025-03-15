local default_options = { noremap = true, silent = true }

-- Escape insert mode quickly
vim.keymap.set("i", "jj", "<esc>", default_options)

-- Use v to toggle visual mode.
vim.keymap.set("v", "v", "<Esc>", default_options)

-- Move to beginning/end of line
vim.keymap.set("n", "B", "^", default_options)
vim.keymap.set("n", "E", "$", default_options)

-- Center search results
vim.keymap.set("n", "n", "nzz", default_options)
vim.keymap.set("n", "N", "Nzz", default_options)

-- Write (Save) Buffers
vim.keymap.set("n", "<Leader>w", ":update<CR>", vim.tbl_extend("force", default_options, { desc = "Update" }))
vim.keymap.set("n", "<Leader>W", ":wall<CR>", vim.tbl_extend("force", default_options, { desc = "Update Wall" }))
