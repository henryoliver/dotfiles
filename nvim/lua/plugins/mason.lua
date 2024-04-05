return {
    -- Mason
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "yamatsum/nvim-nonicons" },
    config = function()
        local mason = require("mason")
        local nonicons_extention = require("nvim-nonicons.extentions.mason")

        mason.setup({
            ui = {
                icons = nonicons_extention.icons,
            },
        })
    end,
}
