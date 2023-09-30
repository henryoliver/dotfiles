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

        local servers = {
            "bashls",
            "cssls",
            "eslint",
            "gopls",
            "html",
            "jsonls",
            "lua_ls",
            "pylsp",
            "ruby_ls",
            "tailwindcss",
            "tsserver",
            "vimls",
        }

        for _, lsp in ipairs(servers) do
            local config = { capabilities = capabilities }

            -- Custom settings
            if lsp == "tailwindcss" then -- Tailwind
                config.filetypes = { "css", "typescriptreact" }
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

        wk.register({
            l = {
                name = "LSP",
                h = { vim.lsp.buf.hover, "Hover" },
                n = { vim.lsp.buf.rename, "Rename" },
                a = { vim.lsp.buf.code_action, "Action" },
                r = { telescope.lsp_references, "References" },
                d = { telescope.lsp_definitions, "Definition" },
                g = { telescope.diagnostics, "Diagnostics" },
                i = { telescope.lsp_implementations, "Implementations" },
                c = { vim.lsp.buf.declaration, "Declaration" },
                s = { vim.lsp.buf.signature_help, "Signature" },
                y = { telescope.lsp_document_symbols, "Symbols" },
                t = { telescope.lsp_type_definitions, "Type Definition" },
                f = {
                    function()
                        conform.format({ async = true, lsp_fallback = true })
                    end,
                    "Format",
                },
            },
        }, { prefix = "<leader>", mode = "n" })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    end,
}
