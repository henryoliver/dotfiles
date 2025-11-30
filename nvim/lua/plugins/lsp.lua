return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        servers = {
            bashls = {},
            cssls = {
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            },
            gopls = {},
            html = {},
            jsonls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        -- Get the language server to recognize the `vim` global
                        diagnostics = { globals = { "vim", "string", "require", "pairs" } },
                    },
                },
            },
            sqls = {},
            pylsp = {},
            ruby_lsp = {
                cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv("GLOBAL_GEMFILE") },
            },
            svelte = {},
            tailwindcss = {
                filetypes = { "css", "postcss", "javascriptreact", "typescriptreact", "svelte" },
                settings = {
                    tailwindCSS = {
                        lint = {
                            invalidScreen = "error",
                            invalidVariant = "error",
                            invalidTailwindDirective = "error",
                            invalidApply = "error",
                            invalidConfigPath = "error",
                            cssConflict = "warning",
                            recommendedVariantOrder = "warning",
                        },
                        validate = true,
                    },
                },
            },
            ts_ls = {},
            vimls = {},
        },
    },
    config = function(_, opts)
        -- Get default capabilities from cmp_nvim_lsp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Configure each LSP server using the new vim.lsp.config API (Neovim 0.11+)
        for server, config in pairs(opts.servers) do
            -- Merge capabilities into the config
            local server_config = vim.tbl_deep_extend("force", config, {
                capabilities = capabilities,
            })

            -- Use vim.lsp.config to define/customize the server configuration
            vim.lsp.config(server, server_config)

            -- Enable the LSP server
            vim.lsp.enable(server)
        end
    end,
    keys = {
        {
            "<Leader>la",
            function()
                return vim.lsp.buf.code_action()
            end,
            desc = "Action",
        },
        {
            "<Leader>ld",
            function()
                return vim.lsp.buf.definition()
            end,
            desc = "Definition",
        },
        {
            "<Leader>lc",
            function()
                return vim.lsp.buf.declaration()
            end,
            desc = "Declaration",
        },
        {
            "<Leader>lh",
            function()
                return vim.lsp.buf.hover()
            end,
            desc = "Hover",
        },
        {
            "<Leader>lr",
            function()
                return vim.lsp.buf.rename()
            end,
            desc = "Rename",
        },
        {
            "<Leader>ls",
            function()
                return vim.lsp.buf.signature_help()
            end,
            desc = "Signature",
        },
        {
            "<Leader>lt",
            function()
                return vim.lsp.buf.type_definition()
            end,
            desc = "Type Definition",
        },
    },
}
