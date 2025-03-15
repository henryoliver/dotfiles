return {
    ---@type LazySpec
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {
        helpLine = {
            -- whether to show the help line at the top of the buffer
            enabled = false,
        },
    },
    keys = {
        {
            "<Leader>fp",
            function()
                return require("grug-far").open()
            end,
            desc = "Project-Wide",
        },
        {
            "<Leader>fb",
            function()
                return require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Buffer",
        },
        {
            "<Leader>fw",
            function()
                return require("grug-far").with_visual_selection()
            end,
            mode = "v",
            desc = "Current Word",
        },
    },
}
