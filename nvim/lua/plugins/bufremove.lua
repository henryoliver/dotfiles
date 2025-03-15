return {
    ---@type LazySpec
    "echasnovski/mini.bufremove",
    version = false,
    opts = {},
    keys = {
        { "<Leader>x", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "Close Buffer" },
        { "<Leader>X", "<Cmd>luado MiniBufremove.delete()<CR>", desc = "Close All Buffer" },
    },
}
