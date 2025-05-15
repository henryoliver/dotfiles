return {
    ---@type LazySpec
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = "yamatsum/nvim-nonicons",
    opts = {
        preset = "modern", -- false | "classic" | "modern" | "helix"
        notify = false, -- show a warning when issues were detected with your mappings
        ignore_missing = true,
        plugins = {
            marks = false, -- shows a list of your marks on ' and `
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = false,
            presets = {
                operators = false, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <C-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
        layout = {
            width = { min = 40 }, -- min and max width of the columns
            spacing = 50, -- spacing between columns
        },
        icons = { mappings = true },
        show_help = false, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
    },
    config = function()
        -- Mappings
        local wk = require("which-key")

        -- https://neovim.io/doc/user/map.html#_1.4-listing-mappings
        wk.add({
            mode = { "n", "v" },
            { "<Leader>i", group = "AI" },
            { "<Leader>ic", group = "Codecompanion" },
            { "<Leader>ia", group = "Avante" },

            { "<Leader>g", group = "Git" },
            { "<Leader>gh", group = "Hunk" },
            { "<Leader>gl", group = "Link" },

            { "<Leader>s", group = "Search" },

            { "<Leader>l", group = "LSP" },
            { "<Leader>p", group = "LSP Preview" },
        })
    end,
}
