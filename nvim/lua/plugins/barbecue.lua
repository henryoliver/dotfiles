local icons = require("config.icons")

return {
    -- Barbecue
    {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        dependencies = "SmiteshP/nvim-navic",
        opts = {
            show_modified = true,
            kinds = icons.kind,
            symbols = {
                separator = icons.widget.nesting,
            },
        }
    },
}
