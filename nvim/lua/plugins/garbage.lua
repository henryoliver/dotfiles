return {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
        aggressive_mode = false,
        grace_period = 60 * 15, -- 15 minutes
        wakeup_delay = 0,
        notifications = false,
        excluded_lsp_clients = {},
    },
}
