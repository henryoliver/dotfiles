return {
    -- Substitute
    {
        "gbprod/substitute.nvim",
        event = "VeryLazy",
        config = true,
        keys = {
            {
                "s",
                mode = "n",
                function()
                    require("substitute").operator()
                end,
                desc = "Substitute",
            },
            {
                "sl",
                mode = "n",
                function()
                    require("substitute").line()
                end,
                desc = "Substitute line",
            },
            {
                "S",
                mode = "n",
                function()
                    require("substitute").eol()
                end,
                desc = "Substitute eol",
            },
            {
                "s",
                mode = "x",
                function()
                    require("substitute").visual()
                end,
                desc = "Substitute",
            },
        },
    },
}
