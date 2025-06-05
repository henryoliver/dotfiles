return {
    "echasnovski/mini.bufremove",
    opts = {},
    keys = {
        { "<Leader>x", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "which_key_ignore" },
        { "<Leader>X", "<Cmd>luado MiniBufremove.delete()<CR>", desc = "which_key_ignore" },
    },
}
