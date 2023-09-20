return {
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

}
