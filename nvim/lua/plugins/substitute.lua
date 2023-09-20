return {
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
}
