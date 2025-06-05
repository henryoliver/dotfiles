return {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
        -- Browse
        { "<Leader>gly", "<Cmd>GitLink<CR>", mode = { "n", "v" }, desc = "Yank git permlink" },
        { "<Leader>glo", "<Cmd>GitLink!<CR>", mode = { "n", "v" }, desc = "Open git permlink" },
    },
}
