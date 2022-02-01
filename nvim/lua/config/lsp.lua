local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ filetypes = { 'css', 'typescriptreact' } })

lspconfig.vuels.setup({})
lspconfig.svelte.setup({})
lspconfig.tsserver.setup({})

lspconfig.jsonls.setup({ capabilities = capabilities })

lspconfig.pylsp.setup({})
lspconfig.vimls.setup({})
lspconfig.bashls.setup({})
lspconfig.sumneko_lua.setup({})

-- Diagnostics
vim.diagnostic.open_float() -- LSP Prevents inline buffer annotations

local signs = { Error = '', Warn = '', Hint = '', Info = '' }

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = false,
    virtual_text = false,
    update_in_insert = false,
})
