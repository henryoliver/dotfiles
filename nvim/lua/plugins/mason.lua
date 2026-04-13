return {
    "mason-org/mason.nvim",
    dependencies = {
        "yamatsum/nvim-nonicons",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool = require("mason-tool-installer")
        local nonicons_extention = require("nvim-nonicons.extentions.mason")

        mason.setup({
            ui = {
                icons = nonicons_extention.icons,
            },
        })

        mason_lspconfig.setup({
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
                "sqls",
                "vimls",
            },
            automatic_enable = false,
        })

        mason_tool.setup({
            ensure_installed = {

                -- Linter
                "stylelint",
                "eslint_d",
                "jsonlint",
                "revive",
                "rubocop",

                -- Formatter
                "prettierd",
                "stylua",
                "gofumpt",
            },
            auto_update = true,
        })
    end,
}
