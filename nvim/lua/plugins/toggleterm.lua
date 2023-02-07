local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

return {
    -- ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        version = "*",
        -- Mappings
        init = function()
            require("which-key").register({ ["<Leader>t"] = { "<Cmd>ToggleTerm<CR>", "Terminal" } })
            map("t", "<C-w>k", "<C-\\><C-n><C-w>k", default_options)
        end,
    },
}
