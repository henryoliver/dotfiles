return {
    -- Null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#available-sources
            null_ls.setup({
                sources = {
                    -- Style
                    diagnostics.stylelint.with({ name = "StyleLint" }),

                    -- JavaScript
                    -- formatting.rome,

                    formatting.prettierd.with({ name = "Prettier" }),
                    -- formatting.prettier.with({ extra_args = { "--config", vim.fn.expand("~/.config/lsp/prettierrc.json") } }),

                    diagnostics.eslint_d.with({ name = "ESlint" }),
                    -- diagnostics.eslint.with({ extra_args = { "--config", vim.fn.expand("~/.config/lsp/stylelintrc.json") } }),
                    -- code_actions.eslint,

                    -- Lua
                    formatting.stylua.with({
                        name = "StyLua",
                        extra_args = { "--config-path", vim.fn.expand("~/.config/lsp/stylua.toml") },
                    }),
                    diagnostics.luacheck.with({
                        name = "LuaCheck",
                        extra_args = { "--config", vim.fn.expand("~/.config/lsp/luacheckrc.lua") },
                    }),

                    -- Python
                    formatting.black,
                    diagnostics.pylint,

                    -- Others
                    code_actions.gitsigns,
                },
            })
        end,
    },
}
