local icons = require("config.icons")

return {
    -- Barbecue
    {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        dependencies = "SmiteshP/nvim-navic",
        keys = {
            {
                "[e",
                mode = "n",
                function()
                    require("barbecue.ui").navigate(-1)
                end,
                desc = "Barbecue navigate",
            },
            {
                "]e",
                mode = "n",
                function()
                    require("barbecue.ui").navigate(2)
                end,
                desc = "Barbecue navigate",
            },
        },
        opts = {
            show_modified = true,
            kinds = icons.kind,
            symbols = {
                separator = icons.widget.nesting,
            },
        },
    },
}
