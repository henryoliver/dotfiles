return {
    -- Colorizer
    { "norcalli/nvim-colorizer.lua", lazy = true,       ft = "css", opts = { "css" } },

    -- Sentiment
    {
        "utilyre/sentiment.nvim",
        event = "VeryLazy",
        init = function()
            -- `matchparen.vim` needs to be disabled manually in case of lazy loading
            vim.g.loaded_matchparen = 1
        end,
    },

    -- Yanky
    {
        "gbprod/yanky.nvim",
        event = "VeryLazy",
        opts = {
            preserve_cursor_position = {
                enabled = true,
            },
        },
        init = function()
            -- Mappings
            vim.keymap.set({ "n", "x" }, "y", "<plug>(YankyYank)") -- cursor position will not change after performing a yank.
            vim.keymap.set({ "n", "x" }, "p", "<plug>(YankyPutAfter)")
            vim.keymap.set({ "n", "x" }, "P", "<plug>(YankyPutBefore)")
            vim.keymap.set({ "n", "x" }, "gp", "<plug>(YankyGPutAfter)")
            vim.keymap.set({ "n", "x" }, "gP", "<plug>(YankyGPutBefore)")
        end,
    },

    -- Cutlass
    { "gbprod/cutlass.nvim",         event = "VeryLazy" },

    -- Substitute
    {
        "gbprod/substitute.nvim",
        event = "VeryLazy",
        dependencies = "gbprod/yanky.nvim",
        config = function()
            local substitute = require('substitute')
            local yanky_integration = require("yanky.integration")

            substitute.setup({
                on_substitute = yanky_integration.substitute(),
            })
        end,
        init = function()
            -- Mappings
            local substitute = require('substitute')

            vim.keymap.set("n", "s", substitute.operator, { noremap = true })
            vim.keymap.set("n", "ss", substitute.line, { noremap = true })
            vim.keymap.set("n", "S", substitute.eol, { noremap = true })
            vim.keymap.set("x", "s", substitute.visual, { noremap = true })
        end,
    },

    -- Surround
    { "kylechui/nvim-surround", event = "VeryLazy" }
}
