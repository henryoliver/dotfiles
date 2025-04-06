return {
    ---@type LazySpec
    "stevearc/conform.nvim",
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            css = { "prettierd" },
            html = { "prettierd" },
            json = { "prettierd" },
            markdown = { "prettierd" },

            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            svelte = { "prettierd" },

            lua = { "stylua" },
            go = { "gofumpt" },
            ruby = { "rubocop" },
            yaml = { "prettierd" },
            graphql = { "prettierd" },
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
    },
    keys = {
        {
            "<Leader>lf",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Format",
        },
    },
}
