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

-- Paste without yank
vim.keymap.set("x", "p", "_dP", default_options)
vim.keymap.set("x", "P", "_dp", default_options)

-- Navigate Buffers
vim.keymap.set("n", "[b", ":bprevious<cr>", default_options)
vim.keymap.set("n", "]b", ":bnext<cr>", default_options)

-- Close Buffers
vim.keymap.set("n", "<leader>x", ":bdelete<cr>", default_options)
vim.keymap.set("n", "<leader>X", ":bufdo! bdelete<cr>", default_options)

-- Write (Save) Buffers
vim.keymap.set("n", "<leader>w", ":update<cr>", default_options)
vim.keymap.set("n", "<leader>W", ":wall<cr>", default_options)
