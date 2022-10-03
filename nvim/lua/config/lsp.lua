local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.cssls.setup({
    on_attach = on_attach,
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

lspconfig.vuels.setup({ on_attach = on_attach })
lspconfig.svelte.setup({ on_attach = on_attach })
lspconfig.tsserver.setup({ on_attach = on_attach })

lspconfig.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.pylsp.setup({ on_attach = on_attach })
lspconfig.vimls.setup({ on_attach = on_attach })
lspconfig.bashls.setup({ on_attach = on_attach })
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            -- Get the language server to recognize the `vim` global
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- Diagnostics
vim.diagnostic.config({
    signs = true,
    underline = false,
    virtual_text = false,
    update_in_insert = false,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end
