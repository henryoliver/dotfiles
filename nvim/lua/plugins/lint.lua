return {
    ---@type LazySpec
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Define your formatters
        linters_by_ft = {
            css = { "stylelint" },
            json = { "jsonlint" },

            javascript = { "eslint_d" },
            typescript = { "eslint_d" },

            lua = { "stylua" },
            go = { "revive" },
            ruby = { "rubocop" },
        },
    },
    config = function()
        local lint = require("lint")
        local nonicons = require("nvim-nonicons")

        -- Diagnostics
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "" .. nonicons.get("x-circle") .. " ",
                    [vim.diagnostic.severity.WARN] = "" .. nonicons.get("alert") .. " ",
                    [vim.diagnostic.severity.INFO] = "" .. nonicons.get("info") .. " ",
                    [vim.diagnostic.severity.HINT] = "" .. nonicons.get("light-bulb") .. " ",
                },
            },
            underline = false,
            virtual_text = false,
            severity_sort = true,
            update_in_insert = false,
            float = {
                source = true,
                focusable = true,
                border = "rounded", -- none, single, double, rounded, solid
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
