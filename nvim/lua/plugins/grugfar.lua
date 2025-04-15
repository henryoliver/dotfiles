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
            "<Leader>f",
            function()
                return require("grug-far").open()
            end,
            desc = "Find & Raplace",
        },
    },
}
