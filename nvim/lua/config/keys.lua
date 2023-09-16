local default_options = { noremap = true, silent = true }

-- Escape insert mode quickly
vim.keymap.set("i", "jj", "<esc>", default_options)

-- Use v to toggle visual mode.
vim.keymap.set("v", "v", "<Esc>", default_options)

-- Move to beginning/end of line
vim.keymap.set("n", "B", "^", default_options)
vim.keymap.set("n", "E", "$", default_options)

-- Apply Macros with Q
-- Hit qq to record, q to stop recording, and Q to apply.
vim.keymap.set("n", "Q", "@q", { noremap = true })
vim.keymap.set("v", "Q", ":norm @q<cr>", { noremap = true })

-- Navigate Buffers
vim.keymap.set("n", "[b", ":bprevious<cr>", default_options)
vim.keymap.set("n", "]b", ":bnext<cr>", default_options)

-- Close Buffers
vim.keymap.set("n", "<leader>x", ":bdelete<cr>", default_options)
vim.keymap.set("n", "<leader>X", ":bufdo! bdelete<cr>", default_options)

-- Write (Save) Buffers
vim.keymap.set("n", "<leader>w", ":update<cr>", { noremap = true })
vim.keymap.set("n", "<leader>W", ":wall<cr>", { noremap = true })
