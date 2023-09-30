return {
    -- Conform
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    go = { "gofumpt" },
                    html = { "prettierd" },
                    css = { "prettierd" },
                    markdown = { "prettierd" },
                    yaml = { "prettierd" },
                    json = { "prettierd" },
                    javascript = { "prettierd" },
                    typescript = { "prettierd" },
                    svelte = { "prettierd" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    conform.format({ bufnr = args.buf })
                end,
            })
        end,
    },
}
