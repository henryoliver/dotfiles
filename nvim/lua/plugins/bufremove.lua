return {
    "echasnovski/mini.bufremove",
    opts = {},
    keys = {
        {
            "<Leader>x",
            function()
                require("mini.bufremove").delete()
            end,
            desc = "Delete buffer",
        },
        {
            "<Leader>X",
            function()
                require("mini.bufremove").wipeout()
            end,
            desc = "Wipeout buffer",
        },
    },
}
