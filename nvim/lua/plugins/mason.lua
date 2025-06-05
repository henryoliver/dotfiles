return {
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
                -- LSP
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
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        })
    end,
}
