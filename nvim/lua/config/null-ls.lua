local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = { -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#available-sources
        -- Style
        diagnostics.stylelint, -- filetypes = { "scss", "less", "css", "sass" }

        -- JavaScript
        formatting.prettier.with({ extra_args = { '--config', vim.fn.expand('~/.config/lsp/prettierrc.json') } }), -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql" }
        diagnostics.eslint, -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
        code_actions.eslint,

        -- Lua
        formatting.stylua.with({ extra_args = { '--config-path', vim.fn.expand('~/.config/lsp/stylua.toml') } }),

        -- Python
        formatting.black,
        diagnostics.pylint,

        -- Others
        diagnostics.vint,
    },
})
