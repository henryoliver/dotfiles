local spec = {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

function spec:init()
    local icons = require("config.icons")

	vim.diagnostic.config({
		severity_sort = true,
		virtual_text = {
			spacing = 2,
			prefix = " " .. icons.layout.list,
			suffix = " ",
		},
		float = {
			source = true,
			border = "rounded",
			header = "",
			prefix = " " .. icons.layout.list .. " ",
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
        vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = hl, numhl = nil, culhl = nil })
    end
end

function spec:config()
	local cmp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local windows = require("lspconfig.ui.windows")

	windows.default_options.border = "rounded"
	lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
		config.capabilities = vim.tbl_deep_extend("force", config.capabilities, cmp.default_capabilities())
		config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	end)

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    lspconfig.bashls.setup({ capabilities = capabilities })

    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.jsonls.setup({ capabilities = capabilities })

    lspconfig.lua_ls.setup({})
    lspconfig.pylsp.setup({ capabilities = capabilities  })

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
    lspconfig.tsserver.setup({ capabilities = capabilities })

    -- Mappings
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition({ reuse_win = true }) end, { desc = "Definition"})
    vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Diagnostic" })
    vim.keymap.set("n", "<leader>lc", vim.lsp.buf.declaration, { desc = "Declaration" })
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature" })
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
    vim.keymap.set("n", "<leader>ly", vim.lsp.buf.type_definition, { desc = "Type Definition" })
end

return spec
