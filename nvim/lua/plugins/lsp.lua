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

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        local servers = {
            "bashls",
            "cssls",
            "gopls",
            "html",
            "jsonls",
            "lua_ls",
            "pylsp",
            "ruby_lsp",
            "tailwindcss",
            "ts_ls",
            "vimls",
        }

        for _, lsp in ipairs(servers) do
            local config = { capabilities = capabilities }

            -- Custom settings
            if lsp == "cssls" then -- CSS
                config.settings = {
                    Lua = {
                        -- Get the language server to recognize the `vim` global
                        diagnostics = { globals = { "vim", "string", "require", "pairs" } },
                    },
                }
            elseif lsp == "tailwindcss" then -- Tailwind
                config.filetypes = { "css", "javascriptreact", "typescriptreact" }
                config.settings = {
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
                }
            elseif lsp == "lua_ls" then -- Lua
                config.settings = {
                    Lua = {
                        -- Get the language server to recognize the `vim` global
                        diagnostics = { globals = { "vim", "string", "require", "pairs" } },
                    },
                }
            end

            lspconfig[lsp].setup(config)
        end

        -- Diagnostics
        vim.diagnostic.config({
            signs = true,
            underline = false,
            virtual_text = false,
            severity_sort = true,
            update_in_insert = false,
            float = {
                source = true,
                focusable = true,
                border = "rounded", -- none, single, double, rounded, solid
                header = " Diagnostics",
                prefix = " " .. icons.layout.list .. " ",
                suffix = " ",
            },
        })

        local signs = {
            Error = icons.log.error,
            Warn = icons.log.warning,
            Hint = icons.log.hint,
            Info = icons.log.information,
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = nil, numhl = nil, culhl = nil })
        end
    end,
    init = function()
        -- Mappings
        local wk = require("which-key")
        local conform = require("conform")
        local telescope = require("telescope.builtin")

        wk.add({
            { "<leader>l", group = "LSP" },
            { "<leader>la", vim.lsp.buf.code_action, desc = "Action" },
            { "<leader>lc", vim.lsp.buf.declaration, desc = "Declaration" },
            { "<leader>ld", telescope.lsp_definitions, desc = "Definition" },
            {
                "<leader>lf",
                function()
                    conform.format({ async = true })
                end,
                desc = "Format",
            },
            { "<leader>lg", telescope.diagnostics, desc = "Diagnostics" },
            { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
            { "<leader>li", telescope.lsp_implementations, desc = "Implementations" },
            { "<leader>ln", vim.lsp.buf.rename, desc = "Rename" },
            { "<leader>lr", telescope.lsp_references, desc = "References" },
            { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature" },
            { "<leader>lt", telescope.lsp_type_definitions, desc = "Type Definition" },
            { "<leader>ly", telescope.lsp_document_symbols, desc = "Symbols" },
        })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    end,
}
