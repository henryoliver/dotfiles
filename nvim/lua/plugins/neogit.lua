return {
    ---@type LazySpec
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    opts = {},
    keys = {
        { "<Leader>gn", "<Cmd>Neogit kind=floating<CR>", desc = "Neogit" },
    },
}
