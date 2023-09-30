return {
    -- Ufo
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter", "kevinhwang91/promise-async" },
        keys = {
            {
                "zO",
                mode = "n",
                function()
                    require("ufo").openAllFolds()
                end,
                desc = "Fold open all",
            },
            {
                "zC",
                mode = "n",
                function()
                    require("ufo").closeAllFolds()
                end,
                desc = "Fold close all",
            },
        },
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },
    },
}
