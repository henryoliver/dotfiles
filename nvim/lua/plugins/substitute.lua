return {
    ---@type LazySpec
    "gbprod/substitute.nvim",
    opts = {},
    keys = {
        {
            "s",
            function()
                require("substitute").operator()
            end,
            desc = "Substitute",
        },
        {
            "sl",
            function()
                require("substitute").line()
            end,
            desc = "Substitute line",
        },
        {
            "S",
            function()
                require("substitute").eol()
            end,
            desc = "Substitute eol",
        },
        {
            "s",
            function()
                require("substitute").visual()
            end,
            mode = "x",
            desc = "Substitute",
        },
        {
            "sx",
            function()
                require("substitute.exchange").operator()
            end,
            desc = "Exchange operator",
        },
        {
            "sxx",
            function()
                require("substitute.exchange").line()
            end,
            desc = "Exchange line",
        },
        {
            "X",
            function()
                require("substitute.exchange").visual()
            end,
            mode = "x",
            desc = "Exchange visual selection",
        },
        {
            "sxc",
            function()
                require("substitute.exchange").cancel()
            end,
            desc = "Cancel exchange",
        },
    },
}
