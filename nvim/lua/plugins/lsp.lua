return {
    ---@type LazySpec
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
            pylsp = {},
            ruby_lsp = {},
            tailwindcss = {
                filetypes = { "css", "javascriptreact", "typescriptreact" },
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
        local nonicons = require("nvim-nonicons")
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for server, config in pairs(opts.servers) do
            config.capabilities = capabilities
            lspconfig[server].setup(config)
        end

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
                prefix = "\n" .. nonicons.get("square") .. " ",
                suffix = " ",
            },
        })
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
