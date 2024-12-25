return {
    -- Conform
    -- Lightweight yet powerful formatter plugin for Neovim
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            local conform = require("conform")

            conform.setup({
                -- Define your formatters
                formatters_by_ft = {
                    css = { "prettierd" },
                    go = { "gofumpt" },
                    html = { "prettierd" },
                    javascript = { "prettierd" },
                    json = { "prettierd" },
                    lua = { "stylua" },
                    markdown = { "prettierd" },
                    ruby = { "rubocop" },
                    svelte = { "prettierd" },
                    typescript = { "prettierd" },
                    yaml = { "prettierd" },
                },
                -- Set default options
                default_format_opts = {
                    lsp_format = "fallback",
                },
                -- Set up format-on-save
                format_on_save = { timeout_ms = 500 },
                -- Customize formatters
                -- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
                formatters = {
                    rubocop = {
                        command = "bundle exec rubocop",
                    },
                },
            })
        end,
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
