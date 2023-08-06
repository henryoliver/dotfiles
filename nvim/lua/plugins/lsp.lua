local icons = require("util/icons")
local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            -- Helpers to install LSPs and maintain them
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({
                capabilities = capabilities,
                settings = {
                    css = {
                        validate = false,
                    },
                    less = {
                        validate = false,
                    },
                    scss = {
                        validate = false,
                    },
                },
            })
            lspconfig.tailwindcss.setup({
                filetypes = { "css", "typescriptreact" },
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
            })

            lspconfig.vuels.setup({})
            lspconfig.svelte.setup({})
            lspconfig.tsserver.setup({})

            lspconfig.jsonls.setup({ capabilities = capabilities })

            lspconfig.pylsp.setup({})
            lspconfig.vimls.setup({})
            lspconfig.bashls.setup({})
            lspconfig.sumneko_lua.setup({
                settings = {
                    Lua = {
                        -- Get the language server to recognize the `vim` global
                        diagnostics = { globals = { "vim", "string", "require", "pairs" } },
                    },
                },
            })

            -- Diagnostics
            vim.diagnostic.config({
                signs = {
                    active = true,
                    values = {
                        { name = "DiagnosticSignError", text = icons.error },
                        { name = "DiagnosticSignWarn",  text = icons.warning },
                        { name = "DiagnosticSignHint",  text = icons.hint },
                        { name = "DiagnosticSignInfo",  text = icons.information },
                    },
                },
                virtual_text = false,
                update_in_insert = false,
                underline = false,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>l"] = { name = "LSP Client" },
                ["<Leader>lh"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
                ["<Leader>ln"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
                ["<Leader>la"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
                ["<Leader>lr"] = { "<Cmd>lua vim.lsp.buf.references()<CR>", "References" },
                ["<Leader>ld"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
                ["<Leader>lc"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
                ["<Leader>ls"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
                ["<Leader>lf"] = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
                ["<Leader>ly"] = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
            })

            map("n", "[g", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", default_options)
            map("n", "]g", "<Cmd>lua vim.diagnostic.goto_next()<CR>", default_options)
        end,
    },
}
