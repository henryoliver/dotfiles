return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim", -- optional - enhances diff viewing
    },
    cmd = "Neogit",
    opts = {
        integrations = {
            telescope = true,
            diffview = true,
        },
    },
    keys = {
        { "<Leader>gn", "<Cmd>Neogit kind=floating<CR>", desc = "Neogit" },
    },
}
