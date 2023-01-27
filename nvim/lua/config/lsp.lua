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
