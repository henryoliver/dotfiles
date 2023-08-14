local icons = require("util/icons")
local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

return {
    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        event = "UIEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                sort_by = "insert_after_current",
                show_close_icon = false,
                show_buffer_close_icons = false,
                modified_icon = icons.dot_fill,
            },
        },
        -- Mappings
        init = function()
            map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", default_options)
            map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", default_options)
            map("n", "[t", "<Cmd>BufferLineMovePrev<CR>", default_options)
            map("n", "]t", "<Cmd>BufferLineMoveNext<CR>", default_options)
        end,
    },
}
