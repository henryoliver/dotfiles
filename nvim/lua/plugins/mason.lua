return {
    ---@type LazySpec
    "williamboman/mason.nvim",
    dependencies = {
        "yamatsum/nvim-nonicons",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_tool = require("mason-tool-installer")
        local nonicons_extention = require("nvim-nonicons.extentions.mason")

        mason.setup({
            ui = {
                icons = nonicons_extention.icons,
            },
        })

        mason_tool.setup({
            ensure_installed = {
                "html",
                "cssls",
                "jsonls",

                "ts_ls",
                "svelte",
                "tailwindcss",

                "gopls",
                "ruby_lsp",
                "bashls",
                "lua_ls",
                "pylsp",
                "vimls",

                "eslint_d",
                "rubocop",
                "stylelint",

                "prettierd",
                "stylua",
            },
            auto_update = true,
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        })
    end,
}
