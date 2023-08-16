local icons = require("util/icons")
local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            -- Enable autoclompletion via nvim-cmp
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            lspconfig.bashls.setup({})

            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                    },
                },
            })
            lspconfig.pylsp.setup({})

            lspconfig.tailwindcss.setup({})
            lspconfig.tsserver.setup({})

            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = false,
                update_in_insert = false,
                underline = false,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded", -- none, single, double, rounded, solid
                    source = "always",
                    header = nil,
                    prefix = " ",
                    suffix = " ",
                },
            })

            local signs = { Error = icons.error, Warn = icons.warning, Hint = icons.hint, Info = icons.information }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = nil, numhl = nil, culhl = nil })
            end
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
