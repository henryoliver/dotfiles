return {
    ---@type LazySpec
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = "yamatsum/nvim-nonicons",
    opts = {
        preset = "modern", -- false | "classic" | "modern" | "helix"
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <C-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        icons = { mappings = true },
    },
    config = function()
        -- Mappings
        local wk = require("which-key")

        wk.add({
            mode = { "n", "v" },
            { "<Leader>i", group = "AI" },
            { "<Leader>g", group = "Git" },
            { "<Leader>gh", group = "Hunk" },
            { "<Leader>gt", group = "Toggle" },
            { "<Leader>f", group = "Find & Raplace" },
            { "<Leader>l", group = "LSP" },
            { "<Leader>s", group = "Search" },
            { "<Leader>p", group = "Preview" },
        })
    end,
}
