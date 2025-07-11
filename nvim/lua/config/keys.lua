local default_options = { noremap = true, silent = true }

-- Escape insert mode quickly
vim.keymap.set("i", "jj", "<esc>", default_options)

-- Use v to toggle visual mode.
vim.keymap.set("v", "v", "<Esc>", default_options)

-- Move to beginning/end of line
vim.keymap.set("n", "B", "^", default_options)
vim.keymap.set("n", "E", "$", default_options)

-- Write (Save) Buffers
vim.keymap.set(
    "n",
    "<Leader>w",
    "<Cmd>update<CR>",
    vim.tbl_extend("force", default_options, { desc = "which_key_ignore" })
)
vim.keymap.set(
    "n",
    "<Leader>W",
    "<Cmd>wall<CR>",
    vim.tbl_extend("force", default_options, { desc = "which_key_ignore" })
)

-- Sort lines by length
vim.keymap.set(
    "v",
    "gs",
    "!awk '{ print length, $0 }'|sort -n -s|cut -d' ' -f2-<CR>",
    vim.tbl_extend("force", default_options, { desc = "Sort lines by length" })
)

-- Toggle relative line numbers
vim.keymap.set("n", "gl", function()
    vim.opt_local.relativenumber = not vim.opt_local.relativenumber
end, vim.tbl_extend("force", default_options, { desc = "Toggle relative line numbers" }))
