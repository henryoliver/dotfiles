local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.tailwindcss.setup({ filetypes = { "css", "typescriptreact" } })

lspconfig.vuels.setup({ on_attach = on_attach })
lspconfig.svelte.setup({ on_attach = on_attach })
lspconfig.tsserver.setup({ on_attach = on_attach })

lspconfig.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.pylsp.setup({ on_attach = on_attach })
lspconfig.vimls.setup({ on_attach = on_attach })
lspconfig.bashls.setup({ on_attach = on_attach })
lspconfig.sumneko_lua.setup({ on_attach = on_attach })

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
