return {
    -- LSP
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local icons = require("config.icons")
        local lspconfig = require("lspconfig")

        -- :lua =vim.lsp.get_active_clients()[1].server_capabilities
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- local on_attach = function(client, bufnr)
        --     client.server_capabilities.semanticTokensProvider = nil
        -- end

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = {
            "html",
            "cssls",
            "tailwindcss",
            "tsserver",
            "jsonls",
            "pylsp",
            "vimls",
            "bashls",
            "lua_ls",
        }
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
            }
        end

        -- Custom settings
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
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
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    -- Get the language server to recognize the `vim` global
                    diagnostics = { globals = { "vim", "string", "require", "pairs" } },
                },
            },
        })

        -- Diagnostics
        vim.diagnostic.config({
            signs = true,
            underline = false,
            virtual_text = false,
            severity_sort = false,
            update_in_insert = false,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded", -- none, single, double, rounded, solid
                source = "always",
                header = " Diagnostics",
                prefix = " ",
                suffix = " ",
            },
        })

        local signs = {
            Error = icons.log.error,
            Warn = icons.log.warning,
            Hint = icons.log.hint,
            Info = icons.log.information
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = nil, numhl = nil, culhl = nil })
        end
    end,
    init = function()
        -- Mappings
        vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition({ reuse_win = true }) end,
            { desc = "Definition" })
        vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Diagnostic" })
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.declaration, { desc = "Declaration" })
        vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature" })
        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
        vim.keymap.set("n", "<leader>ly", vim.lsp.buf.type_definition, { desc = "Type Definition" })
    end
}
