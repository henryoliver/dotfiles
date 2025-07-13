return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        local nonicons = require("nvim-nonicons")

        -- Set up linters by filetype (this was missing!)
        lint.linters_by_ft = {
            -- css = { "stylelint" },
            json = { "jsonlint" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            -- lua = { "stylua" },
            go = { "revive" },
            ruby = { "rubocop" },
        }

        -- Rest of your config...
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = nonicons.get("square-fill"),
                    [vim.diagnostic.severity.WARN] = nonicons.get("square-fill"),
                    [vim.diagnostic.severity.INFO] = nonicons.get("square"),
                    [vim.diagnostic.severity.HINT] = nonicons.get("square"),
                },
            },
            underline = false,
            virtual_text = false,
            severity_sort = true,
            update_in_insert = false,
            float = {
                source = true,
                focusable = true,
                border = "rounded",
                header = " " .. nonicons.get("stop") .. " Diagnostics",
                prefix = " " .. nonicons.get("square") .. " ",
                suffix = " ",
            },
        })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
    keys = {
        {
            "<Leader>ll",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint",
        },
    },
}
