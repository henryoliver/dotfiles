return {
    ---@type LazySpec
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
        -- Browse
        { "<Leader>gl", "<Cmd>GitLink<CR>", mode = { "n", "v" }, desc = "Yank git permlink" },
        { "<Leader>gL", "<Cmd>GitLink!<CR>", mode = { "n", "v" }, desc = "Open git permlink" },
        -- Blame
        { "<Leader>gb", "<Cmd>GitLink blame<CR>", mode = { "n", "v" }, desc = "Yank git blame link" },
        { "<Leader>gB", "<Cmd>GitLink! blame<CR>", mode = { "n", "v" }, desc = "Open git blame link" },
        -- Default branch
        { "<Leader>gd", "<Cmd>GitLink default_branch<CR>", mode = { "n", "v" }, desc = "Copy default branch link" },
        { "<Leader>gD", "<Cmd>GitLink! default_branch<CR>", mode = { "n", "v" }, desc = "Open default branch link" },
        -- Default branch
        { "<Leader>gc", "<Cmd>GitLink current_branch<CR>", mode = { "n", "v" }, desc = "Copy current branch link" },
        { "<Leader>gC", "<Cmd>GitLink! current_branch<CR>", mode = { "n", "v" }, desc = "Open current branch link" },
    },
}
