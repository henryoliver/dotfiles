return {
    -- Colorizer
    { "norcalli/nvim-colorizer.lua", lazy = true,        ft = "css",   opts = { "css" } },

    -- Sentiment
    {
        "utilyre/sentiment.nvim",
        event = "VeryLazy",
        config = true,
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
        keys = {
            { "y",  mode = { "n", "x" }, "<plug>(YankyYank)",       desc = "YankyYank" },
            { "p",  mode = { "n", "x" }, "<plug>(YankyPutAfter)",   desc = "YankyPutAfter" },
            { "P",  mode = { "n", "x" }, "<plug>(YankyPutBefore)",  desc = "YankyPutBefore" },
            { "gp", mode = { "n", "x" }, "<plug>(YankyGPutAfter)",  desc = "YankyGPutAfter" },
            { "gP", mode = { "n", "x" }, "<plug>(YankyGPutBefore)", desc = "YankyGPutBefore" },
        },
    },

    -- Substitute
    {
        "gbprod/substitute.nvim",
        event = "VeryLazy",
        dependencies = "gbprod/yanky.nvim",
        config = function()
            local substitute = require("substitute")
            local yanky_integration = require("yanky.integration")

            substitute.setup({
                on_substitute = yanky_integration.substitute(),
            })
        end,
        keys = {
            { "s",  mode = "n", function() require("substitute").operator() end, desc = "Substitute" },
            { "ss", mode = "n", function() require("substitute").line() end,     desc = "Substitute line" },
            { "S",  mode = "n", function() require("substitute").eol() end,      desc = "Substitute eol" },
            { "s",  mode = "x", function() require("substitute").visual() end,   desc = "Substitute" },
        }
    },

    -- Surround
    { "kylechui/nvim-surround",      event = "VeryLazy", config = true },

    -- Ufo
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter", "kevinhwang91/promise-async" },
        keys = {
            { "zO", mode = "n", function() require("ufo").openAllFolds() end,  desc = "Fold open all" },
            { "zC", mode = "n", function() require("ufo").closeAllFolds() end, desc = "Fold close all" }
        },
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end
        }
    }
}
