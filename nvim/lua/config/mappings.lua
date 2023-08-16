local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

-- Escape insert mode quickly
map("i", "jj", "<Esc>", default_options)

-- Use v to toggle visual mode.
map("v", "v", "<Esc>", default_options)

-- Move to beginning/end of line
map("n", "B", "^", default_options)
map("n", "E", "$", default_options)

-- Undo break points
map("i", ",", ",<C-g>u", default_options)
map("i", ".", ".<C-g>u", default_options)
map("i", "!", "!<C-g>u", default_options)
map("i", "?", "?<C-g>u", default_options)

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Quickfix list navigation
map("n", "[q", "<Cmd>cprevious<CR>", default_options)
map("n", "]q", "<Cmd>cnext<CR>", default_options)

-- Location list navigation
map("n", "[l", "<Cmd>lprevious<CR>", default_options)
map("n", "]l", "<Cmd>lnext<CR>", default_options)

-- Apply Macros with Q
-- Hit qq to record, q to stop recording, and Q to apply.
map("n", "Q", "@q", { noremap = true })
map("v", "Q", "<Cmd>norm @q<CR>", { noremap = true })

-- Close Buffers
map("n", "<Leader>x", "<Cmd>bdelete<CR>", default_options)
map("n", "<Leader>X", "<Cmd>bufdo! bdelete<CR>", default_options)

-- Write (Save) Buffers
map("n", "<Leader>w", "<Cmd>update<CR>", { noremap = true })
map("n", "<Leader>W", "<Cmd>wall<CR>", { noremap = true })
